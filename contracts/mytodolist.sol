// SPDX-Licence-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract mytodolist {
    enum TaskStatus {
        // to describe the status of the task here........enum is used.this or that type here
        Pending,
        Finished
    }
    address owner;
    struct Task {
        string desc;
        TaskStatus status;
    }
    Task[] public tasks;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function addTask(string memory _desc) public onlyOwner {
        //this is a function which modifies something in blockchain
        tasks.push(Task(_desc, TaskStatus.Pending));
    }

    function markAsFinished(uint256 id) public onlyOwner {
        //this is a function which modifies something in blockchain
        require(id < tasks.length, "No task has been mentioned");
        tasks[id].status = TaskStatus.Finished;
    }

    function getTaskCount() public view returns (uint256) {
        return tasks.length;
    }

    function getAllTasks() public view returns (Task[] memory) {
        return tasks;
    }

    function getTask(
        uint256 id
    ) public view returns (string memory, TaskStatus) {
        require(id < tasks.length, "No task has been mentioned");
        return (tasks[id].desc, tasks[id].status);
    }
}
