namespace API.Dtos.ClassGroup
{
  public class ClassStudentsDto
  {
    public Guid Id { get; set; }
    public Guid ParentId { get; set; }
    public string StudentName { get; set; }
  }
}