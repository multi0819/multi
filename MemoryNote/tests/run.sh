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
