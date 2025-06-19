Received: from outbound.pv.icloud.com (p-west1-cluster6-host11-snip4-8.eps.apple.com [57.103.67.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B43235BE1
	for <linux-m68k@vger.kernel.org>; Thu, 19 Jun 2025 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750348684; cv=none; b=E3fB1Enpq0a1BBvh97sYpF56Sc7xLF5o2ks7FeZXlu6W+UJBeTd8JgBdNTbzQyUCsUwZNDRUh3zGaAskcKFdRE8+rC683xD/CfsqIFYjw+vXCy+ENIvzR5CMQYVsF3/gBmX6T+6cOi+a0JAA8zZepyVebgPJcOS3UPf4IqDOeFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750348684; c=relaxed/simple;
	bh=tVXh9AribAs8UDPG9E4HO2eUbhdZJBH+2WdaeTrNqH0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QHnpWVk0RJhyPDcVOSukfl+b3cvGSg01eAFaOO7fdP/2ZgphB/aFkEPSxSxiBGgp18pW/dhmvxYxdMQfn6SQUamIoKM7tjHlc+fWL0vZL9t0GdK98r9eO9TL4lAN8dsGcnqTPRXwf3A76RuKoitGcbUeFCXA3Jb4oFB1pbyfwBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=w02KPS72; arc=none smtp.client-ip=57.103.67.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="w02KPS72"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 84D30C0009A;
	Thu, 19 Jun 2025 15:58:00 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; bh=YPsAQ8Q6MNoXQmZzoMjhJnwsNVEYB93/LhjEmzzFr/0=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=w02KPS72adofSRWKTEhhuwL0dEbYtkEgKVDyHmZ0qhnOkSdxOxt7voUtQz82PMGqoXXSm2Nfb8IDmcj49TmXiCRzqY06lXMHCgNPtotyfk9Hwym5F8IjZ2kC5xm/quF/iyunQ7IZUyrO8T2y38J6/cocFWDGrf9cD7xwT5ZlvIo3rTcXl2s+pFG3RuxTOtAsZXT1WvAV3tiz3jGJRjGj+q2lneWIXbx5SV+Yt5tD1fRGxsw7S2A0oPpWAzQiTLNYshxc43ih7Z1ArZgVbzEjo7teMwn324VtTg8Z8SeIAWFcEyAI+Jt022u8JIwwg2RUSMBE+rzPOALtvfaR9arj5w==
Received: from smtpclient.apple (asmtp-me-k8s.p98.prod.me.com [17.56.9.34])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 4E073C00092;
	Thu, 19 Jun 2025 15:57:59 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: Jason Thorpe <thorpej@me.com>
In-Reply-To: <3803048d-d7d7-4ea8-8b32-d6cdece8be45@kernel.org>
Date: Thu, 19 Jun 2025 08:57:48 -0700
Cc: Finn Thain <fthain@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4FA1E668-2837-4DCA-85B3-6D795B6101B5@me.com>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org>
 <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>
 <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org>
 <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
 <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org>
 <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
 <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com>
 <cebbe80cb85e004176ae2b566132d6d8e92e73db.camel@physik.fu-berlin.de>
 <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com>
 <29677f1e81b42c87926875109907485e41587883.camel@physik.fu-berlin.de>
 <38c670cc-6169-4720-a883-c34df26e1a4f@kernel.org>
 <fc9dd771-b010-e593-d8e4-2cdad57722ed@linux-m68k.org>
 <a140ad5e-35c5-4d14-beb4-d55a58fe0181@kernel.org>
 <931c08f8-1d1c-a317-5380-aa41b26bfed4@linux-m68k.org>
 <3803048d-d7d7-4ea8-8b32-d6cdece8be45@kernel.org>
To: Greg Ungerer <gerg@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-ORIG-GUID: cQeD-2HgxHX0QOrh1yNa2JfL_CBTxVzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEzMiBTYWx0ZWRfX8xMFHGbVVIPe
 6U+eUwABOfi8pT9hgCI5B3ragchhkQsL3RZcODcx+nxc+LG9KR4468DeD1T5BZXruJ8ugPEoFcN
 ysSngQyhDYs4VUgcGHP7yiULuejhLWjOJ+Hql22pBh3yDKTN0VZj9kJUVunX97CV0tpMUFtR74e
 /wwwlDQyS4SPiXtDXwm8rFYZNkq/kmfqaVq4amu67A8QiULDU8GirTVvc4kvBTxuiZYcsmvu40e
 8WgWwoy70roaOBvxcNDb2aoTiIYwkPX3qpDH/XbFKiJB+26gbLzuh6LeRVL6OtNZuEMM9rJQc=
X-Proofpoint-GUID: cQeD-2HgxHX0QOrh1yNa2JfL_CBTxVzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0 mlxlogscore=584 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2506190132


> On Jun 18, 2025, at 10:56=E2=80=AFPM, Greg Ungerer <gerg@kernel.org> =
wrote:
>=20
> Granted many ColdFire platforms are short on RAM. Size is a problem.
> New versions of packages almost always get larger, that is an on-going
> problem. Heck even version to version kernel bloat is a problem.
> Especially as the years go on.

As a data point, NetBSD on the sun2 (68010) uses the larger alignment =
just like there rest of the NetBSD m68k platforms and the typical memory =
config for those things is 4MB.  ColdFire is not my jam (too new :-), so =
I=E2=80=99m not really that familiar with the memory configs on those =
platforms.

-- thorpej

