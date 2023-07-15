using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace SmjApp.Utility
{
    public class SmsApi
    {
        public async Task<string> sendSMS()
        {
            string responsString = "";
            var client = new HttpClient();
            var request = new HttpRequestMessage
            {
                Method = HttpMethod.Post,
                RequestUri = new Uri("https://d7sms.p.rapidapi.com/secure/send"),
                Headers =
    {
        { "Authorization", "Basic dmlqYXkuZGFyamkyNDA0QEdtYWlsLmNvbTpBZGdqbXBAODk5MQ==" },
        { "X-RapidAPI-Key", "4d6690a4e5msh3a8c09f4555a94fp1b4ddejsnb247f32e036c" },
        { "X-RapidAPI-Host", "d7sms.p.rapidapi.com" },
    },
                Content = new StringContent("{\r\n    \"content\": \"Test Message from D7-Rapid\",\r\n    \"from\": \"D7-Rapid\",\r\n    \"to\": 9029509624\r\n}")
                {
                    Headers =
        {
            ContentType = new MediaTypeHeaderValue("application/json")
        }
                }
            };
            using (var response = await client.SendAsync(request))
            {
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    response.EnsureSuccessStatusCode();
                    responsString = await response.Content.ReadAsStringAsync();
                    Console.WriteLine(responsString);
                    return responsString;
                }
            }
            return responsString;
        }
    }
}
