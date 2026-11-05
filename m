Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907030;
	b=f6ejvQ+IsziOkcsO6tR2ntmKNIWutjI/uvEQZPUtA4dgCf4edqmlk6xuFWh0LAlKPnFo
	 eQMC53TQzuH/yR8i6In+jyOiUDKyKsHT1WYbjcEMUN7f6dkcy6baHc6uV5ij4dE7GwfWW
	 7LMDStE60lBJ2NXNB13hL4TgrjeLCdYUIMQYvOpIRmQp7L9X+aGOu+rPmD4RyZg7jyEfE
	 GDg3QHDQVxgMpAeqktDzl/EhPS7uQhj8aS1oyzPZNT4rUvR8EFzg+F+pt3fkqxRIAh+a9
	 VzyVken8tALNGbRGNLY8fNoP+GUZfRvOKNMRqhm+7BawxKNBIkZdeiGeL7pFoYG1hKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907030;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=TUEa7eIRLkYlG50VJyzFVsWpbL0zjSyXV5JMm1JJ87k=;
	b=RfGIhhM9mVMUmObVhi0TmVk+VLw3MgvUI0SOJQsOp9baO+AOYr6dg2YUrI08waX7kqa4
	 5HUvTYwpHMptBTxZ5mSNpsxsQc6/ZNsmv1alKZFt6SGZ8xclidg+LZpI3QJHmW2MoPDKL
	 pn0/apLxYMY01P73v8CaIBcbomJC1bP4PMvE6igyUOZ4CpuEmjeP7BGfLytj9NfaDVOXZ
	 mOnKrbHaincfZDlUJLCXQ0cF9asXBaIHxvViLOyx8hvON83M3Rvti9HNnfoa4/2FeFdeC
	 /ux7coQk571D275UPQh9qNk/cY24U8gdmzqybYYPuEv6RTd9ZJRC0km2XULu/T5EUVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EzE5K//c";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CA8608360C
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2CA8608360C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EzE5K//c
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2ECEF601C2;
	Thu,  5 Nov 2026 19:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F291F00A02;
	Thu,  5 Nov 2026 19:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907028;
	bh=TUEa7eIRLkYlG50VJyzFVsWpbL0zjSyXV5JMm1JJ87k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EzE5K//cJCfees6tq1n/aL2ZXIFBE5phY+UQOmHq0vN8UPvYS/t9kkzR12V91SBSS
	 mhS7JX+wWb8SSFsgjQLGWb/WG0xY7lURsW1aoepv/YNSVEiw0q1fXhrM33YsC2iYcX
	 Y+waIrwUG/i8Vo4xsrxYyrlh/w1ZXi6PT5QOp69R3v0bZCzhRKgl7jMf/20Nx+KlzW
	 0im/yzY5zXpuAl+QtNTMGdrxcjVY3ep9xLEZXfFos47R/RaVosKingXECZ1lFQe2/a
	 3/8aSX9eI5PmGSLMxslCDj4GFhqROFpYezwD6KMYwTFTCdln5UIo/LVBxVD2dGdOQo
	 DMN8N2/pVc/WQ==
Message-ID: <sashiko-outbox-199911@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 48/51] proc: sysctl: don't hold the tables
 while readdir copies to userspace
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-48-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-48-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:30:26 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_sys_readdir() holds the directory's table for the whole readdir
> and the table of each entry while dir_emit() copies its name to
> userspace. Unregistering a table waits until nobody uses it anymore. So
> a getdents64() whose buffer faults for as long as it wants keeps
> unregister_sysctl_table() waiting, just like a stalled read() does.
> Listing /proc/sys/net/ipv6/conf/<dev>/ that way holds up the removal of
> the device under RTNL.
>=20
> So don't take any table into use for a listing. A header counts what
> refers to its memory, the inodes made for it, and unregistering doesn't
> wait for those. readdir takes one of those references on the entry it is
> at instead, which keeps the header around and nothing else. Under
> sysctl_lock, where unregistering erases an entry, it finds the entry,
> copies its name, follows a link to the entry it stands for and pins
> that. Then it looks the dentry up, creates the inode if there is none,
> [ ... ]
> directory was done.
>=20
> Fixes: 77b14db502cb ("[PATCH] sysctl: reimplement the sysctl proc support=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D48

