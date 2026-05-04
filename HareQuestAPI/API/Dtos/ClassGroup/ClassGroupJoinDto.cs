namespace API.Dtos.ClassGroup
{
  public class ClassGroupJoinDto
  {
    public string ClassCode { get; set; }
    public string ClassLevel { get; set; }
    public Guid ParentId { get; set; }
    public string StudentName { get; set; }
   
  }
}