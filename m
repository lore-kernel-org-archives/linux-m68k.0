Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718074;
	b=zYFVgvI3e0nKudabvN99p7x/8mQG73eIfj42z7+viJgU6IvYS2jfsRtG1bgthq3GozBg
	 ioX7K92am5G/piYVXimD7yO8tvfAfQF+3TdaLw3fj24QmzwoYn1+kyVOTj/nV1oXlGpqE
	 CqsnI4M0tIM+KwQmJlWUw37FYUrW2dl98iv0OhmWScsxpwhxa49OdRKLzT8OC2GWIIxlo
	 OpVGyRVlx+ugc1MxHUn9x9MnqN6ZJ9sdijhsgiXnVTgMngSZpzXeaz1gX3+jZ2He7XLhC
	 ZxoFLJaHRyIh2oerSJWfgOMuaofpjW9mnIu9JJnusxmEc7wuH/BBB59pf6AunWKIY2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718074;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=kvVp6/NtD4O06uidDq3MP9X+fjlnBdRcW45/WP+WAys=;
	b=PLxjsgt27GnL5izJMiQ/buZtTKph6tqHaTT3q2O2Tf515Yf/uwN8qkiEJnG6HJnLvnvo
	 6YfAkg7WPiPsxB2hIbGgseqpMt0t9WqQPpNsVWiuKiZjVhNmyXLzmOb7sNMl+/bNQI5jB
	 rPJJh7a/BAFFreAudDQLE0pPkABKBo+jVu0Jz6ikRNVrNNVSQ2u1mS7+H6LsSxyOEWMLK
	 pM1q0nkuo608WGJQxww3QAtlQYhsDdyaJzB1BSfbcCqfDlyCcACt3rkkocVO3ns8qxh3v
	 dD3gdlxSAhY1WVap/Bqm6POMUwAMLsP5tN3wiJq+dfeZ0D2dyBDMmgiBlG5X1i0qHpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXfOxjF1;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1D4606A7AB
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1D4606A7AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXfOxjF1
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A270741383;
	Tue,  3 Nov 2026 15:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815491F00A16;
	Tue,  3 Nov 2026 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718073;
	bh=kvVp6/NtD4O06uidDq3MP9X+fjlnBdRcW45/WP+WAys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AXfOxjF1cFFOFEeIWx2xBBnAGj77mnIVsvzVgjKhzgr0aqmFy/7m8mW9lEar+8Gjk
	 v8RY/QaM2uCeWfqdy34Mf/rBHgTDRvW5o7+chp43A26AiLXBmD/XfUpAxR/m6HPuvT
	 zJCtoefjleVPx/b6O0g6IeF1TPgVhPsueLpekkb/UkQuFbzbZeP3FdjzqUM056msL7
	 PbV9VDBEK5qU8KSuh9oEBnMpWE49gjG3At0fGXJWRjk6w00B3xBXGEvETcL9ykXr5t
	 A9zIdU4PQivKxdRrE/HP047xrSqTkkvO9699obHnimL7KMB7BxtBBEkHCbOPtxypsN
	 iBvlOP9dg5drg==
Message-ID: <sashiko-outbox-195533@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 06/16] proc: let procfs own the seq_file of
 DEFINE_PROC_SHOW_ATTRIBUTE() files
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
In-Reply-To: <20261102-work-procfs-core-v1-6-75df35e4f8b8@kernel.org>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-6-75df35e4f8b8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:01:11 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the show function and let procfs open the seq_file.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-core-v1-0-75df35e4f8b8@kernel.org?part=3D6

