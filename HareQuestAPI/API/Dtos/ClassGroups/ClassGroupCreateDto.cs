namespace API.Dtos.ClassGroups
{
  public class ClassGroupCreateDto
  {
    public required Guid TeacherId { get; set; }
    public required string ClassName { get; set; }
    public required string ClassLevel { get; set; }
  }
}