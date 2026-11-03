Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719134;
	b=qN3qjPSf6OlayhalZXGmbKDK/2KbPFw0sLvtZSlxuArcYJ04oF+00biMAWc9EvOsGsO+
	 iWNANyfpn51mIDT/mPND0XFAySXb5LyaM9BuUQYEFBjnFFqEDuizFpbgyS4xhbn7bQPlf
	 eaLrRdrDVpKp6RVCoFzf87eAxhwQ9UfzX9jrm0ebBHdYogU7D+s3C9jUo5a7Vag4ImgMa
	 cmBOY0uTPU0yLLX9CO/qvKjHCcLOcnpvHN0FZ1OvbTQVS5FsOLXMurOz7HVvWczjwpBfI
	 XlnJ9+YWZJMcek7VeGveC194U41kf9wCMeru2vG0xmKiitqhNZgQPKhTCp/QXdBRc3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719134;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=z6+lpoHQf6RbDNG9fFLF3VrDYJoFB8bCt7Wgh9rVIYM=;
	b=pCZFnSXIBdg6bviF7hERzvVivQpeL317StxEjkeYNZEPSQRxWI/hQOarhRqjnzzVfhJl
	 lU2hAnlu8t9iEOItChRJq4yuJCDh+GHxi6uQvMp/Hyv9s6hosMdqD7+fChjN1yPZ0oB+G
	 uPF2luKpZxISWWvAsW9XmqnxwyeQ3fdgKWNHB1Udvh1/vidVGmoV7EN9tCGSO+lS3iNgC
	 fG6wx3xgOeySi9GTi00NJQud8q4B+Ku2ZtUn8lWsHFEa63waaGq929zVWjY0E7xLabt1W
	 6pxE/tXEIexVsGseuh8cJHP4aTyQXXJWUUAlCsiAEPPi0KLYxJAd2dy+QpqnZzpWHRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rcjo5N6W;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC35C606EE88
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC35C606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rcjo5N6W
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B1FB60A62;
	Tue,  3 Nov 2026 15:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF021F000C1;
	Tue,  3 Nov 2026 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719132;
	bh=z6+lpoHQf6RbDNG9fFLF3VrDYJoFB8bCt7Wgh9rVIYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rcjo5N6WbPxt2+H7rfMn0U0Qn0UK/j677OEZtoRd7RaKxV3TF0eOjybPm+Wvbn1QD
	 hSU10xi/Ht3/4EFqNAngWEFlKFjOBTZDe271HhpPKO5QqzEULVu1P5axZ8BlukFHE2
	 oyiGctcJgDzhAUtWNdK+tOSgayatUnZ1OsddqjB5Sa9aBwTAMsUI+qoCW5YBvw/inJ
	 E56t40VVP+QCWR5FL7qtLIXAdUD2SXiFQlAlvIN02UVK9jEhtzb4NOZWhSi3Mklo7S
	 1NjomUuGTNSSmAXI0piLRxDEoJT8t632y2Q993FbJx+Vtkql+a0fsVjR65UKzjfWQV
	 ++98Ev+HgB9kg==
Message-ID: <sashiko-outbox-195592@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 12/23] scsi: sg: let procfs own the seq_file of
 allow_dio and def_reserved_size
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
In-Reply-To: <20261102-work-procfs-drivers-v1-12-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-12-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:18:50 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Pass the integer they show as the data of the entry and declare the
> show function, procfs then opens and frees the seq_file. That makes the
> open functions unnecessary.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D12

