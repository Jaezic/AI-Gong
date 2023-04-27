package gcu.backend.classroomservice.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import gcu.backend.classroomservice.model.ClassRoom;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@CrossOrigin(origins = "*")
@Tag(name = "Classroom", description = "강의실 API")
public class ClassroomControler {
    @GetMapping("/test")
    @Operation(summary = "테스트", description = "테스트")
    public ResponseEntity<String> show() {
        return ResponseEntity.ok("hello Gachon University!");
    }

    @GetMapping("/test2")
    @Operation(summary = "뚝딱 만듬 ~", description = "멋진 api")
    public ResponseEntity<String> show2() {
        return ResponseEntity.ok("안녕하세요 ㅋㅋ");
    }

    @GetMapping("/classrooms")
    @Operation(summary = "강의실 목록 조회", description = "강의실 목록을 조회합니다.")
    public ResponseEntity<List<ClassRoom>> getClassRoomList() {
        List<ClassRoom> classRoomList = new ArrayList<ClassRoom>();
        classRoomList.add(new ClassRoom("1", "소프트웨어전공", 1, 30, "대형", true));
        classRoomList.add(new ClassRoom("1", "소프트웨어전공", 1, 30, "대형", true));
        classRoomList.add(new ClassRoom("1", "소프트웨어전공", 1, 30, "대형", true));
        classRoomList.add(new ClassRoom("1", "소프트웨어전공", 1, 30, "대형", true));
        classRoomList.add(new ClassRoom("1", "소프트웨어전공", 1, 30, "대형", true));
        classRoomList.add(new ClassRoom("1", "소프트웨어전공", 1, 30, "대형", true));
        return new ResponseEntity<List<ClassRoom>>(classRoomList, HttpStatus.OK);
    }
}
