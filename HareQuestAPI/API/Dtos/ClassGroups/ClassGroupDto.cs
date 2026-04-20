namespace API.Dtos.ClassGroups
{
  public class ClassGroupDto
  {
    public string Name { get; set; }
    public string ClassCode { get; set; }
    public string ClassLevel { get; set; }
    public List<ClassStudentsDto> Students { get; set; }
  }
}