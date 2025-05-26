Received: from outbound.pv.icloud.com (p-west1-cluster3-host6-snip4-8.eps.apple.com [57.103.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9C41C5F06
	for <linux-m68k@vger.kernel.org>; Mon, 26 May 2025 18:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748283922; cv=none; b=NV0GcHtV+clxgigdXEGG40Qyro1EkWv+kVJTWCv614zcdWjaABdILqE+1tnA5BEoVd42IGV6cKCqqkm28OGFtC8H6QplF1VYuk4FunpYnM0NAyJ5n8aECl3hCUGOV122+6klru41O+urKlSLd1louHc6zUTqjEZQ6z86Itpc9CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748283922; c=relaxed/simple;
	bh=24EYYKYZvMLjB1GwnnXcpDmJu2PBzSCU1UO4MP2KvRw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rn9KCq5tW/QH8ocOyts9uzOvLqUKlAMoxThHyqhRtpX+nc4aCFiBs8SMDcNj4D6fuoQ7O2CEMgnL5kVQTV2n7D2oYd/PFfk4yVAfugjAMzqonKnDPCvIKkmCJGrmW81ncf3cHV/gVNHMQq04Q6uQ2ApVNVtwpkD5iBGRd2ICEUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=DmtjFLCD; arc=none smtp.client-ip=57.103.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="DmtjFLCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	bh=/Ed6aIV7O7Fx3cEtuWQx/vJ9NzUc0xIQXN3bSt3Ldfk=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
	b=DmtjFLCDSLMbkFVQeJvsqfF3DK0X4VRPomzGiLcruoPBfmqdXHCq8tmSznaMHb7MP
	 oEQCXjVJci9abcd78hn3dUSS1rtDgBd1NhpgldJb0599raXyuu3qHerzcfLeYpmdqe
	 jV81FsR3OGScYNht422XyKtwCaD2wAeIcikQAWo2a0B6ZijiHWcrDFZ3F9ycnfJzTl
	 1tCYOZufMPefdtgPPWVSfQ9skbKa+eGVq/374CRv6RDdpdw5MVB2evPscSIzHtg7ln
	 B1gZZQAlQ0x86Gr84Q/0CaNoKIRUZnObzARpbr8C8ZNMVDcg5tochckHQ8anTp4O46
	 3Qb3mMMeDx90Q==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 3E24FC000A6;
	Mon, 26 May 2025 18:25:16 +0000 (UTC)
Received: from smtpclient.apple (asmtp-me-k8s.p98.prod.me.com [17.56.9.34])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id EF435C000A3;
	Mon, 26 May 2025 18:25:15 +0000 (UTC)
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
In-Reply-To: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
Date: Mon, 26 May 2025 11:25:05 -0700
Cc: port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D8AE0197-8FE8-4986-9B1F-09B802BE5DEE@me.com>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-GUID: TK6WoCdX4oEopUm7hc3r5_Gn29oagWKV
X-Proofpoint-ORIG-GUID: TK6WoCdX4oEopUm7hc3r5_Gn29oagWKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_09,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1011 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=673 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503310001 definitions=main-2505260157


> On May 26, 2025, at 8:05=E2=80=AFAM, John Paul Adrian Glaubitz =
<glaubitz@physik.fu-berlin.de> wrote:
>=20
> Now I'm wondering whether why some types on NetBSD such as double have =
8 bytes
> alignment on a 32-bit system. Does anyone know the reasoning for that?

Because that=E2=80=99s what is specified in the System V ABI for m68k.

     https://m680x0.github.io/ref/sysv-m68k-abi-part1.pdf

See Figure 3-1.  =E2=80=9Cdouble=E2=80=9D and =E2=80=9Clong double=E2=80=9D=
 are explicitly 8-byte aligned.

-- thorpej

