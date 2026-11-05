Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907350;
	b=cJl1KfOljaC0SOx5kAyfBMfLtsUGnb1+P8qm5bRIaGI3Fa/k5g50lzeaRr5PeTbY/8Zc
	 eWvKAafPRFjfzBpYugUiP9ss3SRXx8YGNf229vQD6Jc77E4p3cMVs38FVKGi/zYQhRD3E
	 SnkoYEnlt6HOu9PAuEE9NQBXnXnDgd1oMfeb2GgeJgwDZLQvfI2WQ7YIWvW0MydJfYj65
	 kX49HISazwpoHVddStw1bsCMhRZNhCv8MWm78jXIcv7wYxTfsPTGJqqcWzcm581KBu1Oe
	 /cxoXU1WICtzHIE2e1Gl+zdZuA0G/VYSLaBx8xZKDgUvrvXFnvC4664cQfy8by310Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907350;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=AmN7iDpzjJ1PM6HacIbA4oMAV9jT2VXf3oFN7TUN1kQ=;
	b=yTrdsCM6hHvJjUMQNcaCCpC4Cg/2PJCIjAst7sPzch6bAMJ3e0wWdCnVIQ3XF1zInIwh
	 2/P9Mo6dVbjHnnKTfphhxe6F4v7IqPhQHWv6lOnHpDlySOWKGtRzD1a59m258zDL7w1G/
	 lr5Cwhfo8eMkY4gUCSflQ84kQ0Q4Za0Pwap4OOG8UIIpm7bvJrkwuJi5O02jMC23IhtkU
	 +4EOeDWI/cGjSfcXg10yTBcMFvVHl8cSk4GlobTpCYQL0bCoNfNKQwfFd7/1w7MgbUwo1
	 tmy+4YscF8+DDslvBMLvYPq1bXj2DOyQ7G7PZFrcSoxlfJkAVXpH3D0Q8JwoRmdEy4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F2b0FoPl;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EA26079C0A
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72EA26079C0A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F2b0FoPl
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4266943DCF;
	Thu,  5 Nov 2026 19:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C061F0089E;
	Thu,  5 Nov 2026 19:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907350;
	bh=AmN7iDpzjJ1PM6HacIbA4oMAV9jT2VXf3oFN7TUN1kQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F2b0FoPlGpVNh9mR9X4mwXarD/KuCYBVnvUmH6E7tZhJtBt5PCXx933IV6aiReouK
	 LnK4sp79dqsWsQgIRBB52e6C2scR+7O9aq42OmuiMuAhSvxgt8qaQEjRMxcJps+5xW
	 VdeI/08WnjHl5IfcKYrPNVcCkskBx+YzqyRBgsiWHP62+S9vXdFt+dSnKmNPdL54Gi
	 Fu1iRVyhor6sLsyNi3KpdJnVwZfldWCmfqPHKyXacsYeRvCGc5d0g5zBMwG5Z1zMa4
	 riwDW9+fwdB3AHVr9RxmUYb4iBKW9d+rhmsuBt5B7UD8oM7aTO9IwB8MyCJWnccLPv
	 tGGpP6SDL1kpA==
Message-ID: <sashiko-outbox-199947@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 17/23] fs/proc/vmcore: let procfs copy out
 reads
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
In-Reply-To: <20261104-work-procfs-core-v2-17-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-17-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:48 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_read_buf() so procfs copies what is read to userspace
> after it unpinned the entry. __read_vmcore() fills procfs' buffer
> through a kvec iov_iter. So a read goes through that buffer now instead
> of straight from the old memory into the reader's, which is what
> splice() did already. mmap() isn't affected. On ppc64 a machine check
> while reading the old memory used to be recovered through the exception
> table of copy_to_user(), by accident. copy_oldmem_page() copies with
> _copy_mc_to_iter() now, so a read through procfs' buffer recovers from
> it as well.
>=20
> The buffer is 128k, which keeps the entry pinned for one such piece at
> a time, and /proc/vmcore asks for PROC_ENTRY_FULL_READS so that a
> larger read is filled in pieces. kexec-tools treats a short read of it
> as fatal. A read that faults on its buffer in a later piece returns the
> pieces before it now instead of failing with -EFAULT. fadump removes
> /proc/vmcore when its memory is released and that no longer waits for a
> reader that faults on its buffer.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D17

