Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908666;
	b=llTAoj+4ss8JeljCJvaPImwbM9jm5kLCDsxRz0jmKx7Z3QaLHMXXwsWK+gfU5bD4iEJJ
	 jB6LMAKJdqCI0Hsg89bE/o8mCQpE/MiKiDnuvqvOQkblamC1QoDLTsfOnpOKBey43Ls0G
	 GUNemFpSCftjK6v93TE+/DouVYNt49YfXUCBTEn90FWtfqVf+5Jn2FLuVw/dP24S7fhYg
	 mNNzKIZOp8sV4N1+jsC3LXcMZBFdBoDuySmBdj1Ml0X0gwZMTVy94lJ3TJHT2tFauq0QQ
	 aqdJh0J2QgzUyANukw4LbexKhwenW1a96DKma0ktv+5MRI9VlK02FybNm9WI7QMYfcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908666;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=+0ZPlsJcgC8fQm/9DfIFcHmBgWnHYRqC6D/F0NL9Ypw=;
	b=RbV3fN7MfHXViObnzEnz0UGVmsPLFsqyL94tf89Ak5ict+WEbDccGeq+A/WK5GCbMezj
	 ijXhC/4WcpQR+XGJC7D6ie7ODSfiJMVQ6QZpaAsdEK2FCJiGHr233kFgLK7MY9Q7treuf
	 Dt8kU2ASL79boOZUWfNo1rtU0rZABplfkgdYlD3DTvODyH61yMPiuh98pB/V8Qjkypani
	 vm8jLfl9NFkqysLEWFuGoaJ1AK8/7/H3YRLNuDUqIvDJTn3GtmrkP704Wmy6bi6aCn51j
	 b5fKshrofPfEeHGEkqi+er82CXxsO2X/3JLgWFmaP25dtwiSRNgnQdvRwU8kyBQ1gJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGM3e2Tc;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CED9606A6EC
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CED9606A6EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGM3e2Tc
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DA2B419C1;
	Thu,  5 Nov 2026 19:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38B81F008A1;
	Thu,  5 Nov 2026 19:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908666;
	bh=+0ZPlsJcgC8fQm/9DfIFcHmBgWnHYRqC6D/F0NL9Ypw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YGM3e2TcuStLuMJuOG2RpRafGnpgCJEdfRcmM9LL5DdWr6N3sFR9a3Cfc0Q8vWg/s
	 7VB698L03F5heHclmvlh2MufWY99NNhAUYjKXdEiGZdV6X+rMeenhBy7Ncax/PeOXv
	 +jQhttB7U5sm2rhvXAlRk5w7p3OreWYgEQx2WyKancCJ/gZHmqLBJdFdi9GuGPN4jd
	 eqpqsHlDnGedCaSvvukFQmbjNkJJDTs5lSbSSTggahIpQ2vEt5UK+QSwAFzCOBXLrv
	 PSAijHaAKCWhRqAZ/JOy/skqMBdWpo9l9x8Q5hD3NgUxf6hpk67PJVMxTAcZg/PLNi
	 UfVCy6pgzZWrw==
Message-ID: <sashiko-outbox-200042@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 08/30] smb: client: let procfs own the
 seq_file of the smbdirect files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jann Horn" <jannh@google.com>, "Josef
 Bacik" <josef@toxicpanda.com>, "Chris Mason" <mason@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, NeilBrown <neil@brown.name>, "Eric Dumazet" <edumazet@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Al Viro" <viro@zeniv.linux.org.uk>, "Jonathan
 Corbet" <corbet@lwn.net>, "Christoph Hellwig" <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@suse.de>, "Joel Granados" <joel.granados@kernel.org>, "Kees
 Cook" <kees@kernel.org>, "Jan Kara" <jack@suse.cz>, "Jan Kara" <jack@suse.com>, linux-s390@vger.kernel.org, coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, "Takashi
 Iwai" <tiwai@suse.de>, linux-ext4@vger.kernel.org, "Chuck Lever" <cel@kernel.org>, tytso@mit.edu, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <20261104-work-procfs-fs-v2-8-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-8-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:44 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the show function in PROC_FILE_DEFINE() and let procfs open and
> free the seq_file. That makes the open functions unnecessary.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D8

