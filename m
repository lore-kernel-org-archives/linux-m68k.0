Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907028;
	b=bNxDIQGP88Ikf0mvJtPcEOtpRiFY988tKITymddz0jBaoObkDf2LN63X4oKS7z20e/dz
	 8kwQTMJPQUkB3mHtrZCyD+oJ9qYSPlE1FUXvIBpjYDuFZEfceFDV1HxnCvrDBkJ9PCUCp
	 Zprm3ZyLBQmY+rPFxQvewWycproVzTvuBN1Cs8Wpu/tdeF5pbMZltF3xJXd2SxclAgtU+
	 ZEdwpyuisiv9u7ExFvi+EmyQZVX4Dkej8xH+GZka8IqbtD7ZZkZyJug/sTajmCMYgtr6I
	 3yvNbzHL0nwlA/svTIvP8nTea1aEmnocR1ZYatFmiVNDmEW0f1INZkTnofPMyJmIjIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907028;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=XJ6642CpUbmT9faJdQPyT1x7rBQwlIa8jLjslbId/hM=;
	b=sl5Fwcm/ohOpJYNxmx70Ao0jw5HrVJprZZV1W68ZYNgF5bBXeZB92Idlzke2d3UkWosZ
	 yzJVPWhz/k4uhbwScSVOs0aqfS9vfyTUUt+p4AoxbN5YF1Mzjcn0q3WxHOzy00De8n3aB
	 Mj8FzApdLk9bp7ifwibgpgbt72MObUVhnphiOPQwGlOZGk3Use+Jtetu+1Y2qgKcs8+o8
	 2eqbTxbvTsMkky4kqAaADqfgSVcu+Ru7P4SPJILUE1Tt3fhnE8En8KK+AsdX6drFfurJE
	 vnI/aAz85nIbLsp5Tod8f4qgTE6LOC5oaXauUcTJ0/Hxlfv8EzBWYaJQW2dIzk3aw3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P/lqti2w";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0643606B9ED
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0643606B9ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P/lqti2w
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25162601C1;
	Thu,  5 Nov 2026 19:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6041A1F00A16;
	Thu,  5 Nov 2026 19:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907026;
	bh=XJ6642CpUbmT9faJdQPyT1x7rBQwlIa8jLjslbId/hM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P/lqti2w1OrQg4Z7Rh1XUrJV0Rjz7sHRa7GeKVhzsOuNNsupbAfab6BhPFMbRRQ6s
	 R8j5pjl35ymm8jhjHHKcL2Q4aHubkU8vyNWYsO5AmMbS2QDOO/DgRHsMLNj9TrxKe1
	 RLG6VHdhILTSjc66At8B4CNW4ugXE4mn1IgKnc09t9nIGlKrJzpXyj9W12pQoosTgz
	 Ui8sy5shZnv8JDmiwBsQgNMlMgNj3iPBOTCVS4CXbwShJnC18KKd0G7+F0OW8ooQud
	 39xpw8p1V6y27YXqhAEZFOk06bAwJKDYaY5zNC7nznc8A+Y2K4mOb6/4TJKIimOEX3
	 Yxvmf/b2YoZBw==
Message-ID: <sashiko-outbox-199910@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 47/51] proc: sysctl: look at the table under
 sysctl_lock when creating an inode
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-47-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-47-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:30:25 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_sys_make_inode() checks under sysctl_lock that @head isn't being
> unregistered, lets go of the lock, and then reads the mode of @table
> and calls ->set_ownership() with @head. That's fine as long as the
> caller holds @head in use, which keeps unregistering from getting past
> that check. The next patch has a caller that only pins the memory of
> @head. For that one the table, and whatever the owner of the header
> keeps behind it, is only there for as long as nobody unregisters the
> header, which happens under sysctl_lock. So read the mode and set the
> ownership before letting go of the lock. The ->set_ownership()
> callbacks only look up ids in a user namespace.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D47

