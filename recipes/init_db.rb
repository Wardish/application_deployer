script "initialize database" do
  user        "postgres"
  interpreter "bash"
  code <<-"EOS"
    psql -c "DROP DATABASE IF EXISTS #{node['application']['db']['name']}"
    psql -c "DROP USER IF EXISTS #{node['application']['db']['name']}"
    psql -c "CREATE USER #{node['application']['db']['name']} WITH PASSWORD '#{node['application']['db']['password']}'"
    psql -c "CREATE DATABASE #{node['application']['db']['name']} OWNER #{node['application']['db']['name']} ENCODING 'UTF8' LC_COLLATE 'ja_JP.UTF-8' LC_CTYPE 'ja_JP.UTF-8' TEMPLATE template0"
    psql -c "DROP USER apache"
    psql -c "CREATE USER apache"
    psql -c "GRANT CONNECT ON DATABASE #{node['application']['db']['name']} TO apache"
    psql -c "CREATE EXTENSION pgcrypto" #{node['application']['db']['name']}
    psql -c "CREATE EXTENSION pg_trgm" #{node['application']['db']['name']}
  EOS
end