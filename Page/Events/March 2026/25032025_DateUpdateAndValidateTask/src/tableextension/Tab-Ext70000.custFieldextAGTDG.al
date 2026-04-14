tableextension 70000 "cust Field ext AGT_DG" extends "Sales Line"
{

    //     Task:
    //     "
    // Add a new custom date field in the Sales Line table. When a user enters this date, the system should 
    // automatically update the existing Shipment Date to two days earlier than the entered. 
    // Additionally, the system must validate that the field is later than today’s date, and if not, raise an error stating 
    // ' date is out of range
    // "
    fields
    {
        // Add changes to table fields here
        field(123456; "Temp Field AGT_DG"; Date)
        {

        }
    }

}