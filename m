Received: from outbound.pv.icloud.com (p-west1-cluster4-host2-snip4-4.eps.apple.com [57.103.65.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB161EF09D
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085094; cv=none; b=U+EZUCOG6I2ofT0NNOyisvymfWGiRtbkmr9je2KF4x6V0m+zJTR6on6MbRhcNFdJFwBZ+CCB2BMUJZKya+/fK5N7iP3E169HNfzAkSNegQNHmoZRPTYML8sNyVvXJeHYNfH39c44GzfM4rydsUADHKE1h8pE1e9Kh2/z3XGce28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085094; c=relaxed/simple;
	bh=Y1QcR0zTVc3YooCrGbN5b5vSiWQuBZrNjTW8GqvOoFg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QC5bB1Fc47nwQai8K7d4FZBDw5StzZvoimgIaOWDJ0lGK3VItGF1ssXIfnx+1enBk69vJEgMnGm1hkgD4vT94Zi6SGBSjahKCyQWlGfimRW+QPTOjcaNijRp9NMbOCGtb4V+0it//Evb2FyWqAzUx4EuBFyQhtyw1KJJeND9mxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=qsXhf6w2; arc=none smtp.client-ip=57.103.65.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="qsXhf6w2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	bh=Y1QcR0zTVc3YooCrGbN5b5vSiWQuBZrNjTW8GqvOoFg=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
	b=qsXhf6w2urXoRJi4hFioWoXAxEHffRhMqB5NyIFkkVYjNhpF2RiokhpCmMiwJJ8cV
	 2taHk0LGSX5xJuVRULrge5apy178Snb05mmj5lqOrswtuZiqpB0G7oBGIHsitByIYY
	 ZrO+UyIUf1fXxNz70yX7qRtpLIOSilLa+vgW6ACtY1PhTFr+BrTlmNDCNF5BeBEJG7
	 WJTMgK1bkD2FTGydgGCjarZhElisw2pLq0UvxTJW+nP4OmLROuuluANdaNXq3K6Imw
	 EUuAEiSxxTCC5EZ3hoJhjOny84EUeAxWALA8eLKBEdBYN8RX40eWEi9cja2e+coDPf
	 FvlhABzmMudXw==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 12460C0009D;
	Mon, 16 Jun 2025 14:44:49 +0000 (UTC)
Received: from smtpclient.apple (asmtp-me-k8s.p98.prod.me.com [17.56.9.34])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 41242C00092;
	Mon, 16 Jun 2025 14:44:49 +0000 (UTC)
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
In-Reply-To: <f869d1238c15875a29f4cdf7569c176ba81fd6c4.camel@physik.fu-berlin.de>
Date: Mon, 16 Jun 2025 07:44:38 -0700
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Vivier <laurent@vivier.eu>,
 port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <84AEB275-E34D-4D39-AC14-CC6853F4DBA5@me.com>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu>
 <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
 <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu>
 <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
 <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu>
 <5d8b1560fb29bec6d56ff6d8aafb4931a7079b63.camel@physik.fu-berlin.de>
 <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
 <CAMuHMdUH3zfrxSV9UqxnG1dEnHA_SmeYVsmKzV3kzYq6TLnucg@mail.gmail.com>
 <f869d1238c15875a29f4cdf7569c176ba81fd6c4.camel@physik.fu-berlin.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-ORIG-GUID: voqip1WuOSIGslOQEz6Wj3jv9PEdgsRy
X-Proofpoint-GUID: voqip1WuOSIGslOQEz6Wj3jv9PEdgsRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 mlxlogscore=578 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503310001 definitions=main-2506160093



> On Jun 16, 2025, at 4:01=E2=80=AFAM, John Paul Adrian Glaubitz =
<glaubitz@physik.fu-berlin.de> wrote:
>=20
> Strictly speaking, a value of 0x00 indicates SysV ABI [1].
>=20
> But maybe we could use 0x03 for Linux/m68k with 4 bytes alignment.

I mean, that would be wrong, but if you=E2=80=99ve been pained into a =
corner...

-- thorpej

