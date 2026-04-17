namespace API.Dtos
{
  public class ClassGroupDto
  {
    public string ClassName { get; set; }
    public string ClassCode { get; set; }
    public string ClassLevel { get; set; }
    public List<ClassStudentsDto> Students { get; set; }
  }
}