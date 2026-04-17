namespace API.Models
{
  public class ClassStudents
  {
    public Guid Id { get; set; }
    public Guid ParentId { get; set; }
    public Guid ClassId { get; set; }
    public string StudentName { get; set; }
  }
}