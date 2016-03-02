# 2016-03-01 (cc) <paul4hough@gmail.com>
#

INSTALLDIR = ~/scripts

SOURCES		=		\
	itag-date.bash		\
	itag-check-date-geo.pl	\
	itag-rename-files.pl	\
	itag-set-gps.bash	\
	itag-set-dates.bash	\

${INSTALLDIR}/% : %.bash
	install $< $@

${INSTALLDIR}/% : %.pl
	install $< $@


install: $(addprefix ${INSTALLDIR}/,$(basename ${SOURCES}))
