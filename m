Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908659;
	b=gcvmKEGe4zaf7bqooil2wIbOXQ3y3Wr3iPv1UqcicfWjoFFdLLkMiLLHcSnuOo4wEE5n
	 rzrx3/xjuqeTkEYNXrYpZSeXGr5/USaaZL2SkWEGMzE+RRJ1LOmcgCRANYQ1PLzIRO/dW
	 KzoO5GjsCsbQo9Q/TEum0BjaN6cjEl+EYtG4uA7YlpG5SLg4UKVYJNbHNwzwbSBHlGLA7
	 8QpoScDq8/Ow+dTHktgGp+BRP7454UvQSZq5vwK3RxtgkKKG59SqTOSN/CB6ARB2V0tO5
	 vUkyrhVPZjL6ZSKdZPR0hDYW5zRCk8H/8pGAgQ64r8asV6Gk00sr8668wilY4546T1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908659;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=q36wdAfT3M4q+Cutem6dQ8ae+d9ONuWCi9SleDJwiW0=;
	b=B5gB0YjlScfyk0vWV7Lgf66K4ogT6OAmaHSPe7uoDBa5AAJX/g27JKm937KBkG4541VZ
	 QLOxxSeSoGK15bfJ+5aUeDquMTMGZdYRWL1stA4k1NsHm9ANAbEArarh+njLiTcFza+HS
	 vgR/KhCo233M1YxurCxzIk8pDhKV/v/vIGJoZId1uNUahRnrFdId9RTFsbbRVv354EC8T
	 HvpvYN0kGk+WxoVypzIGeklYR34b1KIvOdgbNBRHC3bbZJNX5a8gOVFNUPD7P80gH+2lI
	 VA0tHzdEfNLkli5kCDIswYQF+4230taVn1nlVwxExOv6a5sNeOOyglFMeCzR63OQaMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=injc9oEb;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E590A606B060
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E590A606B060
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=injc9oEb
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AE85442D8E;
	Thu,  5 Nov 2026 19:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351841F008A2;
	Thu,  5 Nov 2026 19:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908658;
	bh=q36wdAfT3M4q+Cutem6dQ8ae+d9ONuWCi9SleDJwiW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=injc9oEbe5u0rMyptfS9zP82jPa6RN+/mt43pW4RrzZ4fqV8lFqqaZay7tq+gFrUt
	 mJbkmSaacLkGWg5NplOvP3NFE2t9+pKrWjd1QvRc/1a2pMaieaiwQ/9iDjsjHM/XFk
	 zSXzZ3RWVG43ppIECUCewZhgzmIHnC4nKqAkFBRHgj3pL3JWPmyNgTX+QXXiEaTfoL
	 Vfq2AQ9lOdZ2AVPzmO6pMyuEBv8Sfd2kD+IBIi2mDxQw+GwgkVOpZCsu5rYAp1zUX7
	 rHoRcWqVKztUt4jkkOAMRq59T+ccqw+Xfuexii4BpQBB+uZsgkAIFsedXfWIExYz3f
	 lrOwI/QAJ+4mw==
Message-ID: <sashiko-outbox-200039@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 05/30] nfsd: factor out setting up the exports
 seq_file
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
In-Reply-To: <20261104-work-procfs-fs-v2-5-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-5-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:35 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Move setting up ->private and taking the reference to the network
> namespace into exports_net_init() and dropping it into
> exports_net_put(). The procfs file needs them without the seq_open()
> and seq_release() around them.
>=20
> No functional changes.
>=20
> Acked-by: Chuck Lever <cel@kernel.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D5

