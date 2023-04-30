using System.Reflection;
using System.Text.Json;

namespace VatesArcanum.Cards
{
    public class CardRepository
    {
        private readonly List<Card> _cards;

        public CardRepository()
        {
            _cards = LoadCardsFromJson();
        }

        private List<Card> LoadCardsFromJson()
        {
            // string assemblyPath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location)!;
            // string jsonFilePath = Path.Combine(assemblyPath, "cards.json");

            string json = File.ReadAllText("./Cards/cards.json");
            return JsonSerializer.Deserialize<List<Card>>(json, new JsonSerializerOptions()
            {
                PropertyNameCaseInsensitive = true
            })!;
        }

        public IReadOnlyList<Card> GetAllCards()
        {
            return _cards.AsReadOnly();
        }
    }
}