Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717285;
	b=Bk3/puI/xVB+S4jf0BacHLF483vfku5gSyY1w3sXCTedQk8ZoMbcbGuhWDPWfwU559mv
	 QuzbCWRPxOoXwu+aKWf2CKdu8Qx7CRxyHcauT0odk96QxjTB5/W5ecEHbeCy6yOUX0q+x
	 /mUHSGXUSAVi8FMdn53lJHmCvSbCAQIKzI9bSjXgrnUGJtceM7MbYb3n/jW9Fo0fsMZ+1
	 4ZGv1gb2Idh5Du25gKhC1tiU+1/GDuyH2+8+vV3zvKLUtSDoNT4HMfT2hZWSr/1MvSApf
	 ahFt3ozYp82oQonRkdwizt60aVp1Sq7LTX0FGnKZaW6tiF+ce6PFhLCFtasJR4v5UKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717285;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=4gvOaN3wvXGJv+/IY1E7diuO1bBr8yQTbePx2Vj3hKc=;
	b=AWU8qiE5iK6Xqwvu8rmixLkvcJw42n6696NvGV50rDobvK0rpFb+f60p/0HLU1Hn5/hR
	 L9FJ5pWhKmIsAFba6blweY6Ydc1UgcO3nGJurMLsnVbtsBRrdGWGncSdc3MPM7oXPqLJH
	 FJyCQcIjzS+R+MzuReUW8skU5L31S8AJ3fnWjKYcN7oONA4p8pqXS7HEhPZ5rKlQF9+gL
	 S6BdJUM+fTRdCbEeZfwoi2WtTMHWFpZBAVdpOZypSiZHK7bbHHtQBZk0ZGybdcmHU/tLL
	 ix4YLhPvxO9CEn9rk5kyXlERFDh0JxYmxZfxCjdgvSBvDiw81MleKzyn5dHX+8UEwvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YmTKMbVB;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C8760A2639
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9C8760A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YmTKMbVB
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01E3960628;
	Tue,  3 Nov 2026 14:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522C41F0093A;
	Tue,  3 Nov 2026 14:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717283;
	bh=4gvOaN3wvXGJv+/IY1E7diuO1bBr8yQTbePx2Vj3hKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YmTKMbVB6uRZLjXwEmTGCZh1HbdFcP+8zoHGrBVs3FcW7jqNS/aLVG4BlExyxSsDi
	 38dJvpm2rvf1W7GZ/BeJ3ROdtFFaZsXbBtoCEGTFCOYaKI0Lf6z06i3opj5SfVmYH4
	 ipI9MxfbEk4PvoPknKAXGNPzP1ISdgwyfESt8i+pcLKN52RF6XDNuCpDPwR9Uc9/+1
	 HQqdQmf6H6L8RFmo6HwRaJux2HSFx1o2jASbcWG8qnKo8kDaCAB0CSVzN8mB9vSXlJ
	 T8PYlXW1wwmvUUuV+8j3OkHlmGF3wk7bmeAtlTk04ChojfBfTSX1bouOrIZWxXnqoh
	 yIYT9uP9AsuWQ==
Message-ID: <sashiko-outbox-195490@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 18/38] proc: don't WARN about a name that is already
 registered
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-18-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-18-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:48:01 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_register() WARNs when the directory already has an entry of the
> same name and fails the registration. Callers that pick their names
> themselves should never get there but some take names from userspace.
> pktgen creates a file for each device a writer of "add_device" adds,
> named after the device. A device can have any name, including "pgctrl"
> or "kpktgend_0", the names of pktgen's own files:
>=20
>   ip link set lo name pgctrl
>   ip link set pgctrl up
>   echo "add_device pgctrl" > /proc/net/pktgen/kpktgend_0
>=20
>   proc_dir_entry 'pktgen/pgctrl' already registered
>   WARNING: fs/proc/generic.c:404 at proc_register+0x555/0x8b0, CPU#0: bas=
h/241
>   Call Trace:
>    proc_create_data+0x9f/0xf0
> [ ... ]
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 6c2f91e077f1 ("proc: use WARN() rather than printk+backtrace")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D18

