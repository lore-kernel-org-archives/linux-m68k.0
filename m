Received: from outbound.pv.icloud.com (p-west1-cluster1-host2-snip4-10.eps.apple.com [57.103.64.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E12EEDE
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 23:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749337583; cv=none; b=VxC/I/SOtowI1TWfMGfw76JajT++UqCip7ZSiTH1XZM2C1RKmB56pWdVTd+8l0gOgZoRuF3jBJpXdzK4u3J1+rO+hzIjXY9Itdmvdh2UGzPbi5Awprm2RVBadofXMa/oRplBt080U7w66JJQv7ATwpurUD7x61Lu/Rd4WYwAFvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749337583; c=relaxed/simple;
	bh=xtJYhB9eXV12GGn6FRT0lXfhmLpjpDbCSecz2nVSxT0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dnv8zAOjbjlZDIIvkwN1ot1dzP5rOnf4tu+lUHvbfb4hBqAa7aIbJcdPT4VaK26mEtXmE9h6LeeJ2SQmUNHz5IdSUAUHXY3fAjiAX0I4++NlXFuKlhg+BQ9vDJ0kbozfV5O3laFf7pMgIoyYOg/DkO+IRwfZiFrFS/v6aEBTSKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=iI3Gl4gk; arc=none smtp.client-ip=57.103.64.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="iI3Gl4gk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	bh=xtJYhB9eXV12GGn6FRT0lXfhmLpjpDbCSecz2nVSxT0=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
	b=iI3Gl4gkYg7qImkvlJ7EWnlWc0LS40LoTn4DKZ+5rasedHd7ddRCpIOuKmz7CIWdH
	 YZwDxzRUoN0wWcSEvdeOavjcLqzDFAbhulCVYMaVdoTiAydHo7xW3vHk+89mthctbB
	 1cYsx9at+XSeDWsxs8S4NTGQp2cxEl4s2Mbqitwjz+3PKn8NPlcUvf0pHeCXhmlEZX
	 wVBy6QNSYgjlX9kzw9cSBUeWBsJ677A885nl+Bxrkhk+UXt2Q6dEg8yQJi6fEZjaHU
	 ZUEtfUBDzlzzGViJ5s/am2sJdqwDBC/+zxxEVZQkrNl5Gk6t5p2gNXJLGb4xI5gMP9
	 N/PD8lFbyfx7Q==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 61AB4C0009D;
	Sat,  7 Jun 2025 23:06:18 +0000 (UTC)
Received: from smtpclient.apple (asmtp-me-k8s.p98.prod.me.com [17.56.9.34])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 3C39AC00092;
	Sat,  7 Jun 2025 23:06:17 +0000 (UTC)
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
In-Reply-To: <87ldq38byn.fsf@igel.home>
Date: Sat, 7 Jun 2025 16:06:06 -0700
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Finn Thain <fthain@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F0697786-0392-46CF-91B3-C4F64391E1BE@me.com>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <87sekbq3f8.fsf@linux-m68k.org> <2126C1A0-7737-4228-9B28-B160C672C8AD@me.com>
 <87ldq38byn.fsf@igel.home>
To: Andreas Schwab <schwab@linux-m68k.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-GUID: 4sqmkKHUdaACRy6EN-5QndioiqKR0xo5
X-Proofpoint-ORIG-GUID: 4sqmkKHUdaACRy6EN-5QndioiqKR0xo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_10,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 mlxlogscore=721 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503310001 definitions=main-2506070169



> On Jun 7, 2025, at 2:43=E2=80=AFPM, Andreas Schwab =
<schwab@linux-m68k.org> wrote:
>=20
> On Jun 07 2025, Jason Thorpe wrote:
>=20
>> https://m680x0.github.io/ref/sysv-m68k-abi-part1.pdf
>=20
> How is that relevant?

It=E2=80=99s literally the ABI we=E2=80=99re all discussing.

-- thorpej

