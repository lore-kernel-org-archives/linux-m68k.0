Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907324;
	b=iSY7aZU4aAPMEvEuHEwwTAGGuIBByMiGe70Z7HVemcMAWd4sSjqnB8HKcAbUOaw/sa4s
	 CPvFDj1fNJZ3rtEr/n/wV4/TGsr7HfLb+Nbcf3KrZmJgrgffq4XOlGTPS0wewFv6xU07y
	 r4XL2ywr+w/jgomirdCshwP+IIpgU9iryRGXs6iS3XENPLpWuR/Ls/fFLJCmQJcVkllWP
	 UNQjW28r3C3g/1Z1tn48hxT8ZmW6lFFHBZ1fs6I21g3niU/sUCzPB1+x3iBwF6/zChtyQ
	 eEoqbzvYOpVTNNsmvbnFC+upa9hUjW13KBsh0kKkBp2m+zGnIZ12WzRmdcbC7w1FvCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907324;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=5h8pyB6ckh/Fez925GIOXUwCgLju8hiN+2v5AZq1zRc=;
	b=KCWugYNiFWGxRalJKc6ODtDa2LnXFlZtR5rKb5AYhNV9kzTLDcK7OrsZsQMomrEMp1Xt
	 Y+MgQX9WvZzOKM6A9uy9/dnbVhWmjQldgSj5vmjfxgCsj8PShnoGrRDT/WVNkabuYnWBD
	 xU7xeCMXhbXajrpVyJj6e6R27v6XOsDVV0geHIMcbSt24vmp7n79KOZZbSivYLqs6FQso
	 cLhoz9I1Mokx3wqAdhDLJ2+bFNF1PS5KzYmj0jcY/XRYVdI11eDSnjSp+w51aCm3SNpn6
	 oJfH0s+N7IvMJFnkXdIik6Iu8jofJJmStWJeU0ZjvIuiNumPasQbjHalG80fxsUsGQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jO6fHT46;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7D560772B5
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A7D560772B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jO6fHT46
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D753760172;
	Thu,  5 Nov 2026 19:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914A31F0089F;
	Thu,  5 Nov 2026 19:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907322;
	bh=5h8pyB6ckh/Fez925GIOXUwCgLju8hiN+2v5AZq1zRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jO6fHT46k3cC0x6jpyWBno3seAJmOL41FS/48htjx/g/4KS0/AOvvTQNDrK+N2tPn
	 eSg4IyWf4G4FhYkE6vVJAuVVPft1L/scrcZOgLSXExy1eZXqRymthLKJHvCZEjshCQ
	 FspK+EGuUBwYnyZw5GP5uQusSuenS6tchWvoKCkW0w6oxWb8XCS/IIeZBRu2cLLxh9
	 nBalMctIah8ehQC7+J0mGQu5fUWTHREU0FPypSNk4wCDvlkwmfvT2GL0NdosSNP/Lg
	 beYsluA0YIqlRpFoO5FkXTCF87+/0zOHnBlziRvMNQSTcpA2DxXltjclWi+UeZDyvx
	 KCSkb1a4yeLIA==
Message-ID: <sashiko-outbox-199934@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 04/23] proc: wait for the last user of an
 entry with wait_var_event()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jann Horn" <jannh@google.com>, "Josef
 Bacik" <josef@toxicpanda.com>, "Chris Mason" <mason@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, NeilBrown <neil@brown.name>, "Eric Dumazet" <edumazet@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Al Viro" <viro@zeniv.linux.org.uk>, "Jonathan
 Corbet" <corbet@lwn.net>, "Christoph Hellwig" <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@suse.de>, "Joel Granados" <joel.granados@kernel.org>, "Kees
 Cook" <kees@kernel.org>, "Jan Kara" <jack@suse.cz>, "Jan Kara" <jack@suse.com>, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, "Takashi
 Iwai" <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, "Chuck
 Lever" <cel@kernel.org>, tytso@mit.edu, dmitry.torokhov@gmail.com, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Anna Schumaker" <anna@kernel.org>, yukuai@fygo.io, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <20261104-work-procfs-core-v2-4-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-4-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:20 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] proc: missing acquire ordering in proc_entry_rundown() wait_var_=
event()
--

commit 983e734e20cf0803ce3936df6614c8375020b212
Author: Christian Brauner <brauner@kernel.org>

proc: wait for the last user of an entry with wait_var_event()

This commit replaces the per-entry pde_unload_completion pointer in
struct proc_dir_entry with wait_var_event() and wake_up_var() on
pde->in_use during proc_entry_rundown().

> diff --git a/fs/proc/inode.c b/fs/proc/inode.c
> index 66a3688757dd7..8795add1898dc 100644
> --- a/fs/proc/inode.c
> +++ b/fs/proc/inode.c

[ ... ]

> @@ -266,11 +267,9 @@ static void close_pdeo(struct proc_dir_entry *pde, s=
truct pde_opener *pdeo)
> =20
>  void proc_entry_rundown(struct proc_dir_entry *de)
>  {
> -	DECLARE_COMPLETION_ONSTACK(c);
>  	/* Wait until all existing callers into module are done. */
> -	de->pde_unload_completion =3D &c;
>  	if (atomic_add_return(BIAS, &de->in_use) !=3D BIAS)
> -		wait_for_completion(&c);
> +		wait_var_event(&de->in_use, atomic_read(&de->in_use) =3D=3D BIAS);

[Severity: Medium]
Should the condition in wait_var_event() use atomic_read_acquire(&de->in_us=
e)
instead of atomic_read(&de->in_use)?

When remove_proc_entry(), remove_proc_subtree(), or proc_remove() calls
proc_entry_rundown(de) while another CPU is executing an in-flight proc
callback, atomic_add_return(BIAS, &de->in_use) returns a value not equal to
BIAS. If that callback finishes and executes atomic_dec_return(&pde->in_use)
in unuse_pde() before proc_entry_rundown() evaluates the wait condition,
wait_var_event() takes its initial fast path:

include/linux/wait_bit.h:
#define wait_var_event(var, condition)					\
do {									\
	might_sleep();							\
	if (condition)							\
		break;							\
	__wait_var_event(var, condition);				\
} while (0)

Because atomic_read() is relaxed, breaking out on the initial check neither
takes the waitqueue lock nor issues an acquire barrier. On weakly-ordered
architectures, memory accesses performed after proc_entry_rundown() (such as
freeing or reading private data after remove_proc_entry() returns, especial=
ly
once the subsequent patch in this series skips pde_unload_lock when
!de->open) could be reordered before memory accesses made by the proc
callback prior to unuse_pde().

Previously, complete() and wait_for_completion() unconditionally provided
release-acquire ordering via the completion waitqueue lock, and the
documentation for wait_var_event() notes that the condition should use
smp_load_acquire() or a similarly ordered access so memory changes made
before the condition became true are visible after the wait completes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D4
