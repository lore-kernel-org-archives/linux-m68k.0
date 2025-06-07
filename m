Received: from outbound.pv.icloud.com (p-west1-cluster2-host10-snip4-1.eps.apple.com [57.103.64.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37CE202960
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749321800; cv=none; b=CDarDBf5jC8Rm3yrLsQNj6Qkc+7Yi0hEknOxMsngr3LiNt8nASbhGzSHU0D+K3jKbVD7WxG7kLnDFsH1CyAkCajjSPsGz/61jOf+flOQb6zcWjmtTpiyuM6mnQsWfAHJvXeJdhMeKHXuuw6zs8wof5WaZmAwehVR3elBJpafSac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749321800; c=relaxed/simple;
	bh=WpvRIKEx2d1OFvYACBDoZDceiAjEs+RjwjC/mtf2SYc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Vip1+4XPmUircIqvh+4xb4KYs8yxGGn41DB0UHUdwH7xjhSH9iJTiXrttgHEwDEFZBJd3WwQtxlymNXmdRLgL12uZewF3N6wzR43sZU3uEOGiF0rvbKygQ5jvWL3NTgYJri2z/mp9dp6Wh3AGdSHbMzatHGyW8nfPuLVLkN0iZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=LqoSEMFW; arc=none smtp.client-ip=57.103.64.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="LqoSEMFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	bh=7aZz1eeVRnygMn68fE9wr3Amc+0FspWrTAA9Udsztko=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
	b=LqoSEMFWPgmF4o1C1pVLAjn1rqDc9Xpf0/EmMIRTE5ram79A9ofBZErO+mwgLeJHS
	 N6qv2ARgu2dbMR8J1Gh3eK3L4O0CvOhp3bVxmVb1iaQv28fGRfp4+BCdAfbNpsxtrW
	 a5LBl41n8bgCzFIx8ZqzGF9CKLfE5f1n4cLWvI5IIw3BqVpJmItowIijTDaHxG12hk
	 lVYFUYI9ZLHWfPxbGtop87DWJXqYt8OJJc29mRj4NSlB18cr5iY+G3KQ9eTJsHxoF2
	 6h+w2Wld8YrUl9k3QlbPv8AGNLYk2ayHPUJLRR0zNf1s7bBT4dIpUSJxFVuo82usZm
	 WGEolCmKDC7bA==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 17078C0009A;
	Sat,  7 Jun 2025 18:43:11 +0000 (UTC)
Received: from smtpclient.apple (asmtp-me-k8s.p98.prod.me.com [17.56.9.34])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id E9802C00092;
	Sat,  7 Jun 2025 18:43:10 +0000 (UTC)
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
In-Reply-To: <87sekbq3f8.fsf@linux-m68k.org>
Date: Sat, 7 Jun 2025 11:43:00 -0700
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Finn Thain <fthain@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2126C1A0-7737-4228-9B28-B160C672C8AD@me.com>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <87sekbq3f8.fsf@linux-m68k.org>
To: Andreas Schwab <schwab@linux-m68k.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-ORIG-GUID: r0QSLHv7VBzA5dQL8Mvw0zRZZ1caJPkQ
X-Proofpoint-GUID: r0QSLHv7VBzA5dQL8Mvw0zRZZ1caJPkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 mlxlogscore=876 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503310001 definitions=main-2506070136



> On Jun 7, 2025, at 2:58=E2=80=AFAM, Andreas Schwab =
<schwab@linux-m68k.org> wrote:
>=20
> On Jun 07 2025, John Paul Adrian Glaubitz wrote:
>=20
>> Who is "we"? The official(!) ABI says that pointers are supposed to =
be aligned
>> with 4 bytes, not 2 bytes.
>=20
> No, that is wrong.  The official ABI uses 2 byte alignment.

https://m680x0.github.io/ref/sysv-m68k-abi-part1.pdf

Figure 3-1 says 4-byte alignment for pointers.  Please show the document =
that says 2-byte.

-- thorpej

