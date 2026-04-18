namespace API.Models
{
  public class ClassGroups
  {
    public Guid Id { get; set; }
    public Guid TeacherId { get; set; }
    public string Name { get; set; }
    public string ClassCode { get; set; }
    public string ClassLevel { get; set; }
    public List<ClassStudents>? Students { get; set; }
    
  }
}