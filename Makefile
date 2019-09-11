.PHONY: examples

CC = xelatex
EXAMPLES_DIR = ./
OUTPUT_DIR = _build
RESUME_DIR = src/resume
RESUME_OLD = src/resume_job
CV_DIR = src/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
RES_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
RES_OlD_SRCS = $(shell find $(RESUME_OLD) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume resume_job, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

resume_job.pdf: $(EXAMPLES_DIR)/resume_job.tex $(RES_OlD_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf ./*.pdf
	rm -rf ./*.out
	rm -rf ./*.log
	rm -rf $(EXAMPLES_DIR)/*.aux
