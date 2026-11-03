Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719106;
	b=iQFwk9pHvrGVAMpYZ6CBYkMhKrFlsqixBYaq1+oZ/83Nmr2IOjG7EmMVIqhZ+r+7j3bD
	 tgZlhitFYKJXPuv7IzRqBOHArO1/RjWr5HyhFHPCkBgVZ+8WWEM+hpOhNSeWSxfFkMQoc
	 PKfDlpNgkvh2d/oF9WUg8bBwTAiSUHK5EKnjIswbcg1zxnZQ6oh+kfrWfU2NYMFe5lZw4
	 SS1MQzKHeBkFktMiz7AAYIChYRZ2bYO4i9MAbd0s/+6BVSz4jkEwlf7s/mId2+eb5Rl/l
	 w6LpKMMNysMP24OPDQUdTIkY63+pJZghfcJ2AeXCDS3u2of7hGdza4aMktkSf6Ec6OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719106;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=TWqkS1sJ4J8AwXzUcvlzgctqPmM6b2lbcq1mti3FIH8=;
	b=1xe1uKNgvmopfemVb0f3n4zMC71C1wkPsER4iI+tD9DHFnrGaOdQB8hnbSkIMcug6Ic0
	 EcIr8bNLoW8sixk37/MU2t/6FJc6zkGgU3bAbWV/yiidj6iC0WXXG+AVbv1YBHVjN3KBA
	 k78aaVcibdE8HXN2J9dV8vgPvZozXqGwtWnB4ivxP8ucOSlSv1Iv/NaicI/TcIs3whC2Y
	 bHdpnykg1+uVMGV7E2D8sCSZPa8gqYC+A7KOUZr1Rji561eW2wIxz7T3p79m1cHl2T4d7
	 aqde8XFGNE/e/NT3FAa06QZ7ymh4lRluMw2PPj3NOCZkWnxzCPvd6xBZbczFGkDnnDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QW0wK+9Y;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E1B606B273
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E1B606B273
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QW0wK+9Y
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AEAA43D38;
	Tue,  3 Nov 2026 15:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DDE1F00A02;
	Tue,  3 Nov 2026 15:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719105;
	bh=TWqkS1sJ4J8AwXzUcvlzgctqPmM6b2lbcq1mti3FIH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QW0wK+9Y1KwBPZU7ppzTMvKuZjZxuXlhpn3SCQkaBJrmEUyVUdnE0iNshxwlgWwb4
	 ElXh6hlb6aUOZ3Ou8PzTVbMD0zRv9e2OJ1ipj8atTY+9KG1zfBr5oCoLkcX0qHjvT+
	 qKp5fcTxYxy+nUqS+gFuk16CXsPXTIziLXEz5bZ+3EHQ3oIq9tx1nXVvQIwjvFk/lb
	 P3Yx//zLB1yLXUbZPEpGBZAJwU7vchbgq5u9OgQAgzW5BDfOMIa9ON8O9xKP9zM4Bv
	 aW9hYzFanu821D/9cq+XEiKabPecbwU0KXXmiBxRuv87/QHzN3gJX3EAnwpcmMtNGn
	 TLa56w1fkY8rw==
Message-ID: <sashiko-outbox-195581@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 01/23] nubus: let procfs own the seq_file of the
 resource files
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
In-Reply-To: <20261102-work-procfs-drivers-v1-1-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-1-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:18:24 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Get the inode from the file instead of ->private, declare the show
> function and let procfs open and free the seq_file.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D1

