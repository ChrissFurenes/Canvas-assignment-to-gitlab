#!/usr/bin/bash

echo "Henter GITLAB issues"
curl -s -X GET --header "PRIVATE-TOKEN: [your gitlab token]" --url "https://[your gitlab adress]/api/v4/issues?per_page=100" > gitlab.issues

Bearer="XXXXXXX"# token for canvas
echo "Henter IKT100 assignments"
curl -s "https://uia.instructure.com/api/v1/courses/16330/assignments?per_page=100" -H "Authorization:Bearer $Bearer" > .IKT100assignments
echo "Henter IKT101 assignments"
curl -s "https://uia.instructure.com/api/v1/courses/16332/assignments?per_page=100" -H "Authorization:Bearer $Bearer" > .IKT101assignments
echo "Henter IKT102 assignments"
curl -s "https://uia.instructure.com/api/v1/courses/16334/assignments?per_page=100" -H "Authorization:Bearer $Bearer" > .IKT102assignments
echo "Henter ING101 assignments"
curl -s "https://uia.instructure.com/api/v1/courses/16188/assignments?per_page=100" -H "Authorization:Bearer $Bearer" > .ING101assignments
echo "Henter INGDATA assignments"
curl -s "https://uia.instructure.com/api/v1/courses/1389/assignments?per_page=100" -H "Authorization:Bearer $Bearer" > .INGDATAassignments
echo "Henter IKT-Grm assignments"
curl -s "https://uia.instructure.com/api/v1/courses/266/assignments?per_page=100" -H "Authorization:Bearer $Bearer" > .IKT-Grmassignments
echo "Henter KU_INGDATA assignments"
curl -s "https://uia.instructure.com/api/v1/courses/15396/assignments?per_page=100" -H "Authorization:Bearer $Bearer" > .KU_INGDATAassignments
echo "Henter MA-006 assignments"
curl -s "https://uia.instructure.com/api/v1/courses/16199/assignments?per_page=100" -H "Authorization:Bearer $Bearer" > .MA-006assignments
echo "Henter MA-007 assignments"
curl -s "https://uia.instructure.com/api/v1/courses/16202/assignments?per_page=100" -H "Authorization:Bearer $Bearer" > .MA-007assignments
echo "Henter MA-178 assignments"
curl -s "https://uia.instructure.com/api/v1/courses/16217/assignments?per_page=100" -H "Authorization:Bearer $Bearer" > .MA-178assignments
echo "Henter NA-007 assignments"
curl -s "https://uia.instructure.com/api/v1/courses/16190/assignments?per_page=100" -H "Authorization:Bearer $Bearer" > .NO-007assignments

touch gitlabREQ

####################################- IKT-100 - ############################################ DONE
i=0
gitlabissues=$(jq -j -r ".[].title" gitlab.issues)
while jq -r ".[$i].name" .IKT100assignments -e
do
canvas=$(jq -j -r ".[$i].name" .IKT100assignments);

if [[ "$gitlabissues" != *"$canvas"* ]]; then
echo "Legger til POST request"
echo -n '[your gitlab url]/api/v4/projects/1/issues?title=' >> gitlabREQ
jq -j -r ".[$i].name" .IKT100assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&labels=IKT100&milestone_id=6&due_date=" >> gitlabREQ
jq -j -r ".[$i].due_at" .IKT100assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&description=" >> gitlabREQ
jq -j -r ".[$i].description" .IKT100assignments | jq -j -Rr @uri >> gitlabREQ
echo "" >> gitlabREQ
fi
i=$(( $i + 1 ));
done

rm .IKT100assignments
####################################- IKT-101 - ############################################ DONE
i=0
while jq -r ".[$i].name" .IKT101assignments -e
do
canvas=$(jq -j -r ".[$i].name" .IKT101assignments);

if [[ "$gitlabissues" != *"$canvas"* ]]; then
echo "Legger til POST request"
echo -n '[your gitlab url]/api/v4/projects/1/issues?title=' >> gitlabREQ
jq -j -r ".[$i].name" .IKT101assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&labels=IKT101&milestone_id=2&due_date=" >> gitlabREQ
jq -j -r ".[$i].due_at" .IKT101assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&description=" >> gitlabREQ
jq -j -r ".[$i].description" .IKT101assignments | jq -j -Rr @uri >> gitlabREQ
echo "" >> gitlabREQ
fi
i=$(( $i + 1 ));
done

rm .IKT101assignments
####################################- IKT-102 - ############################################ DONE
i=0
while jq -r ".[$i].name" .IKT102assignments -e
do
canvas=$(jq -j -r ".[$i].name" .IKT102assignments);

if [[ "$gitlabissues" != *"$canvas"* ]]; then
echo "Legger til POST request"
echo -n '[your gitlab url]/api/v4/projects/1/issues?title=' >> gitlabREQ
jq -j -r ".[$i].name" .IKT102assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&labels=IKT102&milestone_id=7&due_date=" >> gitlabREQ
jq -j -r ".[$i].due_at" .IKT102assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&description=" >> gitlabREQ
jq -j -r ".[$i].description" .IKT102assignments | jq -j -Rr @uri >> gitlabREQ
echo "" >> gitlabREQ
fi
i=$(( $i + 1 ));
done

rm .IKT102assignments
####################################- ING101 - ############################################ DONE
i=0
while jq -r ".[$i].name" .ING101assignments -e
do
canvas=$(jq -j -r ".[$i].name" .ING101assignments);

if [[ "$gitlabissues" != *"$canvas"* ]]; then
echo "Legger til POST request"
echo -n '[your gitlab url]/api/v4/projects/1/issues?title=' >> gitlabREQ
jq -j -r ".[$i].name" .ING101assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&labels=ING101&milestone_id=4&due_date=" >> gitlabREQ
jq -j -r ".[$i].due_at" .ING101assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&description=" >> gitlabREQ
jq -j -r ".[$i].description" .ING101assignments | jq -j -Rr @uri >> gitlabREQ
echo "" >> gitlabREQ
fi
i=$(( $i + 1 ));
done

rm .ING101assignments
####################################- INGDATA - ############################################ DONE
i=0
while jq -r ".[$i].name" .INGDATAassignments -e
do
canvas=$(jq -j -r ".[$i].name" .INGDATAassignments);

if [[ "$gitlabissues" != *"$canvas"* ]]; then
echo "Legger til POST request"
echo -n '[your gitlab url]/api/v4/projects/1/issues?title=' >> gitlabREQ
jq -j -r ".[$i].name" .INGDATAassignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&labels=INGDATA&milestone_id=9&due_date=" >> gitlabREQ
jq -j -r ".[$i].due_at" .INGDATAassignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&description=" >> gitlabREQ
jq -j -r ".[$i].description" .INGDATAassignments | jq -j -Rr @uri >> gitlabREQ
echo "" >> gitlabREQ
fi
i=$(( $i + 1 ));
done

rm .INGDATAassignments
####################################- IKT-Grs - ############################################ DONE
i=0
while jq -r ".[$i].name" .IKT-Grmassignments -e
do
canvas=$(jq -j -r ".[$i].name" .IKT-Grmassignments);

if [[ "$gitlabissues" != *"$canvas"* ]]; then
echo "Legger til POST request"
echo -n '[your gitlab url]/api/v4/projects/1/issues?title=' >> gitlabREQ
jq -j -r ".[$i].name" .IKT-Grmassignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&labels=IKT-Grm&milestone_id=11&due_date=" >> gitlabREQ
jq -j -r ".[$i].due_at" .IKT-Grmassignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&description=" >> gitlabREQ
jq -j -r ".[$i].description" .IKT-Grmassignments | jq -j -Rr @uri >> gitlabREQ
echo "" >> gitlabREQ
fi
i=$(( $i + 1 ));
done

rm .IKT-Grmassignments
####################################- KU_INGDATA - ############################################ DONE
i=0
while jq -r ".[$i].name" .KU_INGDATAassignments -e
do
canvas=$(jq -j -r ".[$i].name" .KU_INGDATAassignments);

if [[ "$gitlabissues" != *"$canvas"* ]]; then
echo "Legger til POST request"
echo -n '[your gitlab url]/api/v4/projects/1/issues?title=' >> gitlabREQ
jq -j -r ".[$i].name" .KU_INGDATAassignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&labels=KU_INGDATA&milestone_id=10&due_date=" >> gitlabREQ
jq -j -r ".[$i].due_at" .KU_INGDATAassignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&description=" >> gitlabREQ
jq -j -r ".[$i].description" .KU_INGDATAassignments | jq -j -Rr @uri >> gitlabREQ
echo "" >> gitlabREQ
fi
i=$(( $i + 1 ));
done

rm .KU_INGDATAassignments
####################################- MA-006 - ############################################
i=0
while jq -r ".[$i].name" .MA-006assignments -e
do
canvas=$(jq -j -r ".[$i].name" .MA-006assignments);

if [[ "$gitlabissues" != *"$canvas"* ]]; then
echo "Legger til POST request"
echo -n '[your gitlab url]/api/v4/projects/1/issues?title=' >> gitlabREQ
jq -j -r ".[$i].name" .MA-006assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&labels=MA-006&milestone_id=12&due_date=" >> gitlabREQ
jq -j -r ".[$i].due_at" .MA-006assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&description=" >> gitlabREQ
jq -j -r ".[$i].description" .MA-006assignments | jq -j -Rr @uri >> gitlabREQ
echo "" >> gitlabREQ
fi
i=$(( $i + 1 ));
done

rm .MA-006assignments
####################################- MA-007 - ############################################
i=0
while jq -r ".[$i].name" .MA-007assignments -e
do
canvas=$(jq -j -r ".[$i].name" .MA-007assignments);

if [[ "$gitlabissues" != *"$canvas"* ]]; then
echo "Legger til POST request"
echo -n '[your gitlab url]/api/v4/projects/1/issues?title=' >> gitlabREQ
jq -j -r ".[$i].name" .MA-007assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&labels=MA-007&milestone_id=8&due_date=" >> gitlabREQ
jq -j -r ".[$i].due_at" .MA-007assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&description=" >> gitlabREQ
jq -j -r ".[$i].description" .MA-007assignments | jq -j -Rr @uri >> gitlabREQ
echo "" >> gitlabREQ
fi
i=$(( $i + 1 ));
done

rm .MA-007assignments
####################################- MA-178 - ############################################
i=0
while jq -r ".[$i].name" .MA-178assignments -e
do
canvas=$(jq -j -r ".[$i].name" .MA-178assignments);

if [[ "$gitlabissues" != *"$canvas"* ]]; then
echo "Legger til POST request"
echo -n '[your gitlab url]/api/v4/projects/1/issues?title=' >> gitlabREQ
jq -j -r ".[$i].name" .MA-178assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&labels=MA-178&milestone_id=5&due_date=" >> gitlabREQ
jq -j -r ".[$i].due_at" .MA-178assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&description=" >> gitlabREQ
jq -j -r ".[$i].description" .MA-178assignments | jq -j -Rr @uri >> gitlabREQ
echo "" >> gitlabREQ
fi
i=$(( $i + 1 ));
done

rm .MA-178assignments

####################################- NO-007 - ############################################
i=0
while jq -r ".[$i].name" .NO-007assignments -e
do
canvas=$(jq -j -r ".[$i].name" .NO-007assignments);

if [[ "$gitlabissues" != *"$canvas"* ]]; then
echo "Legger til POST request"
echo -n '[your gitlab url]/api/v4/projects/1/issues?title=' >> gitlabREQ
jq -j -r ".[$i].name" .NO-007assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&labels=NO-007&milestone_id=3&due_date=" >> gitlabREQ
jq -j -r ".[$i].due_at" .NO-007assignments | jq -j -Rr @uri >> gitlabREQ
echo -n "&description=" >> gitlabREQ
jq -j -r ".[$i].description" .NO-007assignments | jq -j -Rr @uri >> gitlabREQ
echo "" >> gitlabREQ
fi
i=$(( $i + 1 ));
done

rm .NO-007assignments


xargs -n 1 curl --request POST --header "PRIVATE-TOKEN:[your gitlab token]" -O < gitlabREQ



rm gitlabREQ
