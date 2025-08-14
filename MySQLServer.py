#!/usr/bin/env python3
"""
Create the MySQL database 'alx_book_store' without using SELECT/SHOW.
Prints a success message if created (or already exists), and handles errors.
"""

import os
import sys

try:
    import mysql.connector
    from mysql.connector import Error
except Exception as imp_err:
    print(f"Error: Could not import mysql.connector. Install it with 'pip install mysql-connector-python'. Details: {imp_err}", file=sys.stderr)
    sys.exit(1)


def main():
    # Read connection settings from environment (simple, non-interactive defaults)
    host = os.getenv("MYSQL_HOST", "localhost")
    user = os.getenv("MYSQL_USER", "root")
    password = os.getenv("MYSQL_PASSWORD", "")
    port = int(os.getenv("MYSQL_PORT", "3306"))

    conn = None
    cursor = None

    try:
        # Connect without specifying a database
        conn = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            port=port,
        )
        # Ensure statements commit immediately (DDL is autocommit, but this is explicit)
        conn.autocommit = True

        cursor = conn.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

    except Error as err:
        print(f"Error: Failed to connect or create database. {err}", file=sys.stderr)
        sys.exit(1)

    finally:
        # Close cursor/connection if they were opened
        try:
            if cursor is not None:
                cursor.close()
        except Exception:
            pass
        try:
            if conn is not None and conn.is_connected():
                conn.close()
        except Exception:
            pass


if __name__ == "__main__":
    main()
