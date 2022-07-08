FROM aank999/sshdock:v1
EXPOSE 80

COPY . /app
RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]
