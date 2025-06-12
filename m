Received: from outbound.pv.icloud.com (p-west1-cluster3-host11-snip4-10.eps.apple.com [57.103.66.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9871F2380
	for <linux-m68k@vger.kernel.org>; Thu, 12 Jun 2025 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722422; cv=none; b=UM/G1gkxOYlq49kmNcLO5k7rxkeUY806inVFQYb+AyHLPcGA9NbNhtvWIU/66y2+gsFAysiexJhJUC17ikNJGxgq6KEqtVB9Q3k67jJfFe10pl7e8Yv91h0X7R7z0DHZVz8NsYczKjsgcYWqyV6fRxVf7BNUttHUbPgXfaoEJFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722422; c=relaxed/simple;
	bh=ZsSx5eLEImiAIeyNKg5HAQD5PDNcEO8UID1Y36XBhac=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=LgA9wxa4nZy8HycGkCYXN4UXb3vIYbvRNAlOT1iZrEHoPEpfS/bEG50ax6x6BHecQJamDXenfOSS5/uMeyS64IAo5nVJnfzIdw6Q5WVrrohXm+F7n4OrIxV3ejE+5BFB2AoU+Nnk1e2Fc1pOSafax1oRhpo3kQzdS2a+I3QYbZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=ol7C6x9A; arc=none smtp.client-ip=57.103.66.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="ol7C6x9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	bh=ZsSx5eLEImiAIeyNKg5HAQD5PDNcEO8UID1Y36XBhac=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme;
	b=ol7C6x9AT1vP7oVwgXuLY7Ev0SanzzVkOfxUsKrXEhaoVMvyTgHVMbB5xUgESTUNZ
	 b+hDcT2/jWY2T6toiHWjMsrlzV6SaAhFM1z0c5UdyikdRAn4TbASmGBpbtKEcd/hLw
	 CFlZM+8N7xYpHSP2xrNYoAGCRSVaH8ulPLehDET7BPhWdqHPRnLaV2f/fkj7NGdazP
	 vc4cEGU654npWvR+ujqXoSvWLmKWjHdrQSjBcjNBl3WDYSzjzxbjjn17XUD0c0ytNR
	 1iAS0h3NVIQmyoc5wvu7tfqLeIOs+R3ne7cREv8w0sxTdSmHHD5D5Y9pF6Yl738PrP
	 xFpK8N5QzjoPQ==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id E065AC0009C;
	Thu, 12 Jun 2025 10:00:18 +0000 (UTC)
Received: from smtpclient.apple (asmtp-me-k8s.p98.prod.me.com [17.56.9.34])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id AD65BC0009B;
	Thu, 12 Jun 2025 10:00:16 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Jason Thorpe <thorpej@me.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
Date: Thu, 12 Jun 2025 06:00:04 -0400
Message-Id: <7345697D-F323-4B8A-A93B-181EF119B9F6@me.com>
References: <89247655be6ac93710ebc1573a9f08ec293706f2.camel@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>, Stan Johnson <userm57@yahoo.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
In-Reply-To: <89247655be6ac93710ebc1573a9f08ec293706f2.camel@physik.fu-berlin.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Mailer: iPhone Mail (22F76)
X-Proofpoint-ORIG-GUID: BD0KVzKSivZwODHMmLGk-tr_H4Dix3j-
X-Proofpoint-GUID: BD0KVzKSivZwODHMmLGk-tr_H4Dix3j-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 mlxlogscore=531 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.22.0-2503310001 definitions=main-2506120077

It may in fact improve performance; aligned long words require fewer bus cyc=
les.

-- thorpej
Sent from my iPhone.

> On Jun 12, 2025, at 3:18=E2=80=AFAM, John Paul Adrian Glaubitz <glaubitz@p=
hysik.fu-berlin.de> wrote:
>=20
> It's also absurd that you think that switching the alignment to 4 bytes wi=
ll
> make the port considerably slower when the contrary is the case and NetBSD=

> developers on this thread have explained several times that they don't hav=
e
> any issues with 4 bytes alignment. Heck, even Amiga Unix uses 4 bytes alig=
nment.
