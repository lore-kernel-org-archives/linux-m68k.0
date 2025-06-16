Received: from outbound.pv.icloud.com (p-west1-cluster1-host8-snip4-4.eps.apple.com [57.103.64.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FC38488
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084999; cv=none; b=DcPk4rw75bl1RlCiTa/BYKjlfmZR0t+ZXvXvnRNFfjWRZgi465tSZ3tpm+I8MFC+GbwxyCPGhCRGpmJGq5Ii1RJ/WkUH2LdkQFWyLGoPmt+LHLdQdqlu37/GTwibMS9pOWmvgpabpNzx6yQEG5RgNunTeCZ+8JLgtgZRUPSb9H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084999; c=relaxed/simple;
	bh=ChNtRMXJyLZF5aYZEAB3JWng2PijwuxzBM4+8SANodI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bhdBxToOcvg4h8+RFZMCNQKqkTjiqhCmrF3WyPmERLe7E0ZExGCS7P+Cf0/m6B+Y10rgAkdZWFUwrtuseovo0jpXtUZFIIbY0CBX8D1rGUVIUduMxxd6hoqtc7U+ihgRJSpBoWYQpSBKKDaB4MnJKQq4CeUvXQZ8cxHuItp6wTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=rk76NvTJ; arc=none smtp.client-ip=57.103.64.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="rk76NvTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	bh=1Jjc4dt9QrEt90/ccQzE9ASUCxaa9YGrSXVfcUCfdRI=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
	b=rk76NvTJEjQC24MvfR1dcsrL5sotHd2Cj4ZMgWG+zwtRWLmJ8POlCwu3Uk3U5y8ng
	 tx7icMv/+LsSQe8uYlV/RbIN8Rykzj/HEoA2ELCmqsN4Y90zNZL5mGn/ULAjwxHUN/
	 XPT8jdJx8rOc26HwKc6aok17ur8x0hRUItlTEcvTzzleru8r41XXt0P60G3LIyH7o3
	 UKiMDzTDy7kcK0xs+bScdzt3Ww7AoAkMORISEDwNClsMWnZk9o80mTSJjSpC3Qe089
	 P056i/7Rai8eKGJ60fS4iCYqA70oYAM5dG27EbEwNhzKTibUWvz0U7I62lf6xK7dt3
	 rq0IRkpDNLcyw==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 69027C0009A;
	Mon, 16 Jun 2025 14:43:14 +0000 (UTC)
Received: from smtpclient.apple (asmtp-me-k8s.p98.prod.me.com [17.56.9.34])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 75261C00092;
	Mon, 16 Jun 2025 14:43:13 +0000 (UTC)
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
In-Reply-To: <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
Date: Mon, 16 Jun 2025 07:43:02 -0700
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <758E94EA-113D-4FB4-B5EF-1203FB67F520@me.com>
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
To: Laurent Vivier <laurent@vivier.eu>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-GUID: ccwSq1fN8i4Ku0TtKznjqoapmYdoCee_
X-Proofpoint-ORIG-GUID: ccwSq1fN8i4Ku0TtKznjqoapmYdoCee_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503310001 definitions=main-2506160091


> On Jun 16, 2025, at 2:10=E2=80=AFAM, Laurent Vivier =
<laurent@vivier.eu> wrote:
>=20
> I think you need to change the ABI type in the ELF header:
> https://fr.wikipedia.org/wiki/Executable_and_Linkable_Format

4-byte alignment binaries should have ELFOSABI_SYSV (0) (since that ABI =
spec is where the 4 byte alignment comes from).  If Linux/m68k is =
already using that, then those binaries are broken by definition.

Let=E2=80=99s hope existing Linux/m68k binaries are using ELFOSABI_LINUX =
/ ELFOSABI_GNU (3) (sorry, I don=E2=80=99t have any handy to check).

If the existing binaries correctly label themselves has having the =
Linux-specific ABI, then this is trivial and there=E2=80=99s no reason =
to use a note to differentiate them.

-- thorpej

