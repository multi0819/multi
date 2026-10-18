#!/usr/bin/env bash
set -euo pipefail
mkdir -p build/core-test
javac -encoding UTF-8 -d build/core-test app/src/main/java/kr/memorynotes/ReviewScheduler.java app/src/main/java/kr/memorynotes/Cloze.java app/src/main/java/kr/memorynotes/StudyText.java tests/CoreTest.java
java -cp build/core-test CoreTest
javac -encoding UTF-8 -d build/core-test app/src/main/java/kr/memorynotes/ZipGuard.java tests/BackupTest.java
java -cp build/core-test BackupTest

javac -encoding UTF-8 -d build/core-test app/src/main/java/kr/memorynotes/StudyText.java app/src/main/java/kr/memorynotes/Cloze.java app/src/main/java/kr/memorynotes/PhraseSelection.java tests/StudyTextTest.java tests/PhraseSelectionTest.java
java -cp build/core-test StudyTextTest
java -cp build/core-test PhraseSelectionTest

javac -encoding UTF-8 -d build/core-test app/src/main/java/kr/memorynotes/StudyText.java app/src/main/java/kr/memorynotes/SpeechText.java tests/SpeechTextTest.java
java -cp build/core-test SpeechTextTest

if [ -n "${NOTE_TEST_JSON_JAR:-}" ]; then
  javac -encoding UTF-8 -classpath "$NOTE_TEST_JSON_JAR" -d build/core-test app/src/main/java/kr/memorynotes/Note.java app/src/main/java/kr/memorynotes/NoteFilter.java app/src/main/java/kr/memorynotes/ChapterChoices.java tests/NoteFilterTest.java
  java -classpath "build/core-test:$NOTE_TEST_JSON_JAR" NoteFilterTest
fi
