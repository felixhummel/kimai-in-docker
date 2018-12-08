Work around `Column 'rate' cannot be null (#1048)`:
```
docker-compose exec -T mysql mysql -ukimai -pkimai kimai <<'EOF'
ALTER TABLE kimai_timeSheet MODIFY `rate` decimal(10,2) NULL DEFAULT '0.00';
EOF
```

