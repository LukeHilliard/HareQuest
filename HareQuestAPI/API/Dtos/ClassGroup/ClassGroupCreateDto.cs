namespace API.Dtos.ClassGroup
{
  public class ClassGroupCreateDto
  {
    public required Guid TeacherId { get; set; }
    public required string Name { get; set; }
    public required string ClassLevel { get; set; }
  }
}