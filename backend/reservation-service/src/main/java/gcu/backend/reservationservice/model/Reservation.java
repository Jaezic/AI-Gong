package gcu.backend.reservationservice.model;

import lombok.Data;
import lombok.Getter;
import lombok.AllArgsConstructor;
import lombok.Setter;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

// "ClassRoom", MongoDB Collection, used to store the classroom information
// @Data, automatically generate Getter, Setter, toString, Constructor
// @Document, used to specify the name of the collection
@Data
@Document(collection = "reservation")
public class Reservation {
    // Field '_id', type 'ObjectId'
    // Default value is generated by MongoDB
    @Id
    private ObjectId _id;

    // Field 'email', type 'String'
    // This value is the email of the reservation

    // Field 'number', type 'String'
    // This value is the number of the reservation

    // Field 'time', type 'List<Integer>'
    // This value is the time of the reservation

    // Field 'date', type 'String'
    // This value is the date of the reservation

    // Field 'people', type 'int'
    // This value is the number of people of the reservation

    // Field 'state', type 'int'
    // This value is the state of the reservation
    private String email;
    private String number;
    private List<Integer> time;
    private String date;
    private int people;
    private int state;

    // @Transient, used to specify that the field is not in the database
    @Transient
    private String id;

    // Reservation Constructor
    public Reservation(ObjectId _id, String email, String number, List<Integer> time, String date, int people,
            int state) {
        this._id = _id;
        this.email = email;
        this.number = number;
        this.time = time;
        this.date = date;
        this.people = people;
        this.state = state;
        if (_id != null) {
            id = _id.toString();
        }
    }
}
