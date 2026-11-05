Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908168;
	b=oVkFHiSeLicltWE5RTLYux9Z2Y4vCbRYjPsnTOQ5wXuzSeoymxecUX2Or1XxP1il19L6
	 9rZgEsWoPaJtiZvxL40r18cnl1LSVDxdg2LM055IrxEvUhCgu2LxcQUwFdW2myVaN3hUU
	 zK1e/Tr1zclLdj16T6dIcV3voFX+FnU4Ujp03og55hvplGnYnmTcgTVW4Ia7GgGQNE6vA
	 663kbUO/T+Ay+Eo/+WQOmXDHFhsS2pqxSnOZ72nOzOaEttVqBBtaD+uaV0iYc6i6DERIv
	 A0M+62dcNwaAENKoNp87auqKjzCy9jxJ9FH41zCGjubMaFqugWmzKB4zZNd5698pmmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908168;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=9gUuwRbjNCWvszkKrVQPv2hvkpneI8ksA3RSUuxs2Ic=;
	b=3sr8XdK/rVr5RLoc8zJGoHkHJYEHosYVCvN8INIoKtdiwJLBrNOXAjgr8S4PzvEmkLVj
	 jaD9wrJP5v8+M+Ziqrt1ZfVEDPJ6dQOUEc0fyZe1wfqo/qZOBmYQY7vPL4URCJGvBy3w/
	 OV13Ns4ETx8dLVVFGAvOFTBTFY5t8DbdkMpA3QcE9batKIYurpItnfcskpaDrlSYeUDWO
	 AGQhr/15N1cRX2FSwAI08szLBDEQILxOV9phbnXByx0bKvOf3Cslts52lR3acIi++XpgX
	 HGkaWgaPo8fVAa+MbK2RFnNQzGiou98zBFVStgM1xmKiaRqYUhSukHFES8HPlH2qnzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PU4f5WnX;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E16072C41
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 480E16072C41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PU4f5WnX
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90D7A60254;
	Thu,  5 Nov 2026 19:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E146C1F0089F;
	Thu,  5 Nov 2026 19:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908167;
	bh=9gUuwRbjNCWvszkKrVQPv2hvkpneI8ksA3RSUuxs2Ic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PU4f5WnXQqbu2ros5eSzI0HoD++fGry80hTlakGFCv543QdE9RIR9N1nfJdO1KVvR
	 WlKHb7SAAG4ZNzG7YcIvrtw2YbcuHl9NxsC+Ry9ZH5u2A67KR3SHRiB1+qIThnXmvD
	 +e7+sOx53NUfD233kgOcnm8ngO0U1WkIITZi2L7zE9BRD+7Z1PMQjtuLjHjTgEpvcz
	 qNzcsCjCNxebuksa5ERjy7TcK7HkPvop0GlZBd65yGx122qWgbaW/s5Rdk/NgmYZdf
	 9memhwmnIL19lEfr0LQmOsjvY//yByOLUV8CZx6MBvkb6egGaMxFR33H6U2T2D+oIU
	 6AAcZfSosMTGQ==
Message-ID: <sashiko-outbox-199996@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 10/26] scsi: let procfs own the seq_file of
 the host files
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
In-Reply-To: <20261104-work-procfs-drivers-v2-10-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-10-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:25 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the show function and let procfs open and free the seq_file of
> /proc/scsi/<driver>/<host>. ->proc_open() only preallocates the buffer
> now. Reading the file then no longer holds up its removal when the host
> goes away.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D10

