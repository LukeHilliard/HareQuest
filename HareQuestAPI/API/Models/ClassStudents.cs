using System.ComponentModel.DataAnnotations.Schema;

namespace API.Models
{
  public class ClassStudents
  {
    public Guid Id { get; set; }
    public Guid ParentId { get; set; }
    public Guid TeacherId { get; set; }
    public Guid ClassId { get; set; }
    [ForeignKey("ClassId")]
    public ClassGroups ClassGroup { get; set; }
    public string StudentName { get; set; }
    public string ClassCode { get; set; }
    public string ClassLevel { get; set; }
  }
}