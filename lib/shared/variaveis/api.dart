/*
Para colocar o servidor em pé: 

Terminal 1: docker run -p 3307:3306 mysql 
Terminal 2: dotnet ef database update && dotnet watch run
Terminal 3: ssh -R 80:localhost:5164 serveo.net

Copia o link e cola abaixo
*/

const String apiUrl = 'https://praeter.serveo.net/api';
