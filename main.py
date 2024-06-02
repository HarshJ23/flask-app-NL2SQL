from flask import Flask, jsonify, request
from langchain_community.utilities.sql_database import SQLDatabase
from sqlalchemy import create_engine
from langchain_community.agent_toolkits import create_sql_agent
from langchain_openai import ChatOpenAI
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)

# Database connection setup
connectionString = os.getenv("DATABASE_URL")
db_engine = create_engine(connectionString)
db = SQLDatabase(db_engine, view_support=True, schema="dbo")

# LLM setup
openai_api_key = os.getenv("OPENAI_API_KEY")
llm = ChatOpenAI(openai_api_key=openai_api_key, model="gpt-3.5-turbo", temperature=0)
agent_executor = create_sql_agent(llm, db=db, agent_type="openai-tools", verbose=True)

@app.route('/query', methods=['POST'])
def execute_query():
    try:
        # Extract query from the POST request
        query = request.json.get('query')

        # Invoke the query
        result = agent_executor.invoke(query)
        
        return jsonify(result), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
