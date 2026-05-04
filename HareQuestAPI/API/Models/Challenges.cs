namespace API.Models
{
  public class Challenges
  {
    public Guid Id { get; set; }
    public Guid ClassGroupId { get; set; }
    public string Name { get; set; }
    public int Reward { get; set; }
  }
}