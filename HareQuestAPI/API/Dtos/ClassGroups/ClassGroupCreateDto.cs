namespace API.Dtos.ClassGroups
{
  public class ClassGroupCreateDto
  {
    public Guid TeacherId { get; set; }
    public string ClassName { get; set; }
    public string ClassLevel { get; set; }
  }
}