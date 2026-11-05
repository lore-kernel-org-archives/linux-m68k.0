Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908692;
	b=MWjEJgsVSxU9OFgkwz7vqvBxUt7Ds9iaCPRotBHdi22xuiwSgp+roL5BpngH9/JScUk7
	 98TKStYnQ010D8PrECvw/48eGo7jnwmvgn1HFCwutJZD12UOzF0MGxeAbhtTpbA51Qt80
	 trF5eH6452qdBmO/1xMDYmRri1dwHAcR8hgVOlqbWb/RGNLgfnCXl1y/zh4a5eYkKdg1s
	 QKp7GeVUjpFHP9JmfpI4of/hrm9oGydYBSWQs6D05QWhBJLLdldQ38FMEpRVeLzTwenSf
	 ZZYIr+V6Z8C2zff8yC43+Cvm4BhPwTws9AFUZ+JYWiDuSv3y0izq0n9WzVmBm3WHTpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908692;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=VJM1TPMHTJ5mBUuyXhBiQ3F6ibJxzxb1q4lJPp3RzWY=;
	b=WPWsn4zMuugsQDGebK9vnDOp0IoxiwFw2pZv0vatHBFmR201PO1vvWKNImrgIKmNWEdh
	 8sfzbSQgLzoPNbATv8S0Nv5kGKbmpx4UcUzKiAMTBNJr8VjfpCQwu+ocXQBRG97bw9Pvu
	 7VAeVhv/ozmp8LAAVvI3dhSLi/S5Sc7lcwoSrlBuaM+e3gQXdh5em9QcYG0IqLGQ6rtdC
	 GxlWun4K4IZ3sBG6VsGwu5rZi0TrZymyhgR2k5N4zdEYRA9bB39oW44QIVbM6roOzLRVR
	 rNTyHpWThTg5zqo1Ed7CBvszhk4zaUZ6wXgwPYv7FGfyfYtC24fjN8M+vExr/QQ0Kwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R49qB2P0;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1983606A6D9
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1983606A6D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R49qB2P0
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F13F602C3;
	Thu,  5 Nov 2026 19:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19A41F008A4;
	Thu,  5 Nov 2026 19:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908691;
	bh=VJM1TPMHTJ5mBUuyXhBiQ3F6ibJxzxb1q4lJPp3RzWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R49qB2P0qXLUlPstwwn/cwYKqB7OFfz4cOrfsP1tHpUFMXL/az8OchsolUY+GEzN8
	 qPorB5vIYuDFFbNWXZE4dER721Q9iHKmNr9gTXfDYm5AJvXye0eCPOLB5v3lQH3wnt
	 lPQrL8L7KfQOJJHq7nla/3TPNFRoqsbYIXYWjsoCrXCJKCIXzvkbiOVXSwuJWI0CoY
	 O1TU2YPeucS7sioJZWTFApiz83C+NIGiwdWch89cqPQW8+W+41Rn/7BQvAoF14Rwa5
	 cS6JRLtxWDf46VmERQg3QZMBNyOybQruZCkAsYR0VLJVVC6hEyS2CEDKwXXOsQKShk
	 bBlenIqZvFSoQ==
Message-ID: <sashiko-outbox-200054@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 20/30] sched/psi: let procfs own the wait
 queue of the pressure files
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
In-Reply-To: <20261104-work-procfs-fs-v2-20-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-20-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:58:09 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> A trigger on one of the /proc/pressure files has a wait queue of its
> own for its poller, the cgroup pressure files use the queue of their
> kernfs node through kernfs_generic_poll() and kernfs_notify(). procfs
> owns the queue of its pressure files now, so use it the same way: the
> poll_wait() is procfs', and a trigger that fires wakes the pollers of
> its file with proc_poll_notify(). Like for the cgroup files every
> poller of the file is woken when any trigger on it fires, and each
> reports the state of its own trigger. psi_trigger_poll() doesn't need
> the file anymore.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D20

