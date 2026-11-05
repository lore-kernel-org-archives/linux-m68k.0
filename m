Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908684;
	b=hdUd6I1QM58uhlfQT9cPDmgBEKGd4jNQzOm9YzQAbqRSCKFvpHaNRLqogUM2oqD5Eod3
	 DhNdw5ALeTQpgK9WTmAJXlRhGbBAAt3K5EZuALTTmjkfL5I3Hn26UZbWgvv0yjw/OFzvE
	 cMPE4g3MnYcn2DeZAGuNgQrhBK6yAEmQ4yN67QIp8EX4D7r5VVdtwDFKUYRyiOkCWAsfr
	 a1EXNO6YQgrmQwVpkjFOpGioTcDyVPoG4MA5jZSO0BFPG0RlEXJb+lWPLhJkflalrPzLf
	 qVwR9BvTpJ8NZZym1MIuOEqUT+3Q7Jwt2J5PlruD2ScA3iSs9ou3b4KHyP/TeLmU34g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908684;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=xQw5Y21Jefdqk+NLJ1bgD2wYB6yjyjtlILHzStlkXtg=;
	b=C871W73rqZnl3sI6mdugvkI0C3UHLovMjo1L2u8HTSEpnum9Q12AlBFRUMhRSMy7J0qG
	 9/A26jImQyZ68qPMcaiHj7kCvpYubNrKISSZmgVLpPsWWbsdOjQGqPUU7IXRbtFtYK4Ra
	 Uxs92ZkvlIUopLzzp70MhebEShjZ/DxqR5H68ju7ODHf548y9ueqfITz4f5xkNwLLqmlS
	 vsjJaEiz6tU/3LmvtbYnFTQ4tBLjjI+XIDhHW3iKRbLCQvqy2detpgyPPWKoGouarlOvf
	 jfpWEBXoOC4GvCptLeFsz7j1gG2b8cP/I1cbn0tJnpLFXchexZYr+4amTEVOO5zqenQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLjGD6ne;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1754D606B06D
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1754D606B06D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLjGD6ne
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F165F40A73;
	Thu,  5 Nov 2026 19:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FFC1F008A2;
	Thu,  5 Nov 2026 19:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908683;
	bh=xQw5Y21Jefdqk+NLJ1bgD2wYB6yjyjtlILHzStlkXtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DLjGD6ne+zHJ6l2NtLBp7WGG5HHEcKsAxosFKuR0a7RNuYJAWYFmlP+Eo4EW1JlwF
	 0VqWA8iJu/xUCfFf45PRI6wxw6ubU1MPAtOe4gnsizzUCn5G90TIhkS+JaYX/xS0Rt
	 KJgyyZLcQTrRIU+/OkMZbrLRNYgpvjs3AQ62AWHHgn+9vKzQLgChpIiAzq6Sfn7mbe
	 QHvGzpOfFXUXvhf6Sp6Bstrs4fyt+JGWdnKOviq93faMpWfzEPEWnjRXTOWMz15JYf
	 bGpLKj6EreLgLDC1RKy7AynA060/DZ2MLXiHudUwyVC6r2EJBdb29sdOTmnyqWnhCd
	 8WBHWj+qczWmQ==
Message-ID: <sashiko-outbox-200051@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 17/30] sched/psi: let procfs own the seq_file
 of the pressure files
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
In-Reply-To: <20261104-work-procfs-fs-v2-17-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-17-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:58:02 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the show functions and let procfs open and free the seq_file of
> /proc/pressure/*. That makes the open functions unnecessary and
> ->proc_release() only destroys the trigger now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D17

