Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784260;
	b=OcnQoOD6f/SFyRA0vy16MThsKxzO/0glQKZEcENw7a9i1OSbgyfoLVaXdcsbYVxzqnd8
	 QHaHq52YYq9vP0vRK0A++K201UwF+2ExSaulUnRaf+UX9VTYVm0CKTeRJ2/x2FuIQjTEP
	 qInW44+F+M2CFr6mXpgiE9an8mKSX7A/VUEgpVMTxqhH8/CzVSgTXbDhNZT8LWWIpwwkW
	 zSdfzcGv9LZEWAQuKKnBs93u27Y2WF1vVWoMGSp0KuduBdpdenmLoTDHQOgQYhHBiWWaX
	 SkBxzDIFUAqOnVWHYagPkJMG3dCkClG71GP0i8Dj/wu04/6O7KpI/9LNU2XzBgs+PcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784260;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gRXRlKwKxN+fSCr/T6i8djt87uv7sYA7hvMrxndI77U=;
	b=Pfi/j9AUm5Hehu9gZGzvEYur2Vt6EiEWYuL9XjHOJ0Aoi7/2G0r2q4ZPcEvER2t33KAK
	 151KP2UY+AGcXaVsOwiM33sC/oDYxDNrmA9hcJvLF5aaduSKRz4tK3EsX6u+o2T8TALJP
	 MfJTnqgnl07y/5HvYJmIBVvUwCcm/qNSgGNIgvFoxhETvpR6pnBoyl3ZrySc2zWAOMleH
	 sWxjRkJJqt72OLYOEVClLzLw0EnoO0RHD7DW5yN+fP97lien2IV0DW2RKpwL5isR+3klO
	 zZcLbSLHSVvwptSD1Y6PoFOW5QxkF0A4hgEUcceXDkooDAqWaMtivyDrN16pKzL0LOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05029606A329
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 09:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05029606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AAC8241A8A;
	Wed,  4 Nov 2026 09:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00EB1F000C1;
	Wed,  4 Nov 2026 09:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793784259;
	bh=gRXRlKwKxN+fSCr/T6i8djt87uv7sYA7hvMrxndI77U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DtCghqTk4F1EE9ZiaGiOl/CLyemjVYDJ+E2iTwlEuHko0AF2WQqNB2tyP1et6JQZd
	 /s/kPoz0A0zF+b5fFAIFD3ImxnjD/VWhr5VSKRweQqln4RDl4AQZ0FVMn/i/yt7O88
	 Ps9wlo2Fnfedf7faqa4SwwEANP4Q/4diwjkTX3mMumkt7VPx2Dq0vxvGBgDryWLmiO
	 5lerAYpepz4/m8aYVA7ag928SM+ijqD5yy+IBJRJI2YPtpIITX1SvmPZzKqLhu/h1W
	 WugE4uZByige6JL65yaTwMSDm+rRPo4EHgbghVb7x5+GS84YvD8WL3izKpfkYLWK0G
	 hw+mR5o35+RDA==
Date: Wed, 4 Nov 2026 10:24:07 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, 
	Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Eric Dumazet <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, 
	Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados <joel.granados@kernel.org>, 
	Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
	linux-input@vger.kernel.org, linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-modules@vger.kernel.org, Chuck Lever <cel@kernel.org>, tytso@mit.edu, 
	dmitry.torokhov@gmail.com, Petr Pavlu <petr.pavlu@suse.com>, 
	Anna Schumaker <anna@kernel.org>, yukuai@fygo.io, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [PATCH RFC 04/16] proc: let procfs own the seq_file of seq_file
 entries
Message-ID: <20261104-hiebe-ausmachen-express-e9c87b962865@brauner>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-4-75df35e4f8b8@kernel.org>
 <sashiko-outbox-195531@kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-195531@kernel.org>

On Tue, Nov 03, 2026 at 03:01:06PM +0000, sashiko-bot@kernel.org wrote:
> - [High] proc: unpinned dereference of pde->seq_ops->next in pde_seq_next()

Nothing in the tree returns ERR_PTR(-EIO) from ->next but moving the
check up would remove that possibility so yes.
