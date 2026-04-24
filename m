Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758A454763
	for <linux-m68k@vger.kernel.org>; Fri, 24 Apr 2026 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015985; cv=none; b=N3XmIsxwBu98+hLzLQssay/767tewSQvNsKMbR3icKMoZHXLzK47bE+nSvd8wG5kqGfJT7nDD1aaGUJEi8/DqK11MuIJnBMDPG135OmOkPQMfPj1W+ap+0OwQZqNq0Sadyv0kk7MAKuSFLdozdPsavcK3H3Z3a36tQcrVXZ2LNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015985; c=relaxed/simple;
	bh=OwiB5xL70HUG2XBD1Qstzuk6LTv1Ph8boI/7kSdoh18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNcQNFrKhryKWOooFZxbsjmALlj1B7XeUqdrJvqzpGDaDJwPC18SoXZTsmc3OH/KPld1m640uoFgGxguzoO/95AgQub5gTxG/fppKNYILh/e41VdLSyZzkesQ9bGhWy8dO9ZiuflwPdo41BUyhVm5U0hYUNvmX0tOgYe5pvOTrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso7186195e0c.0
        for <linux-m68k@vger.kernel.org>; Fri, 24 Apr 2026 00:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015982; x=1777620782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NtsbXOcyL1ibQALxU6C+oQAYrNmZZMuQ00aeNmrTt40=;
        b=I5zuMW+2vtq9N02GZCJ7AdBXJzKT7W2EMX/XcIxRtJv3xz5cPtApuoUS8Ww5Tp5mrg
         iSIzU0SWXgITKTERc2xPG3T21FzUjQ+2Lg19iN0j5DrXkKbNQdgPs9U3kEWU15+XjOgm
         +dnGvu+AeftTl643XhDkfdsif6CELEMqUp8h8Brrl11DJMZBT41I0raMIBcPpEtXa8LS
         ei+rqL5dY5YAjP7Y6BH2ahLb2iNH8Wla3rNznQWsTNO01TEFhzcp7hhHPbSLWVKpTGvC
         Ctp7XpYJJO5Q43B35fUOTdfwzmcQp77A/ipaqqGAJvV5oVplS60NRf8dn8Ru9Tq7F1Tq
         FGag==
X-Forwarded-Encrypted: i=1; AFNElJ+P7JEVDLrFP/157t4BnXjQ03jbAmtuKtmBj7lsQ0TBzZh7tOJ/LjvMbX5toGU4ideeOKrDakKZ1StL@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+YPxdLWgrviKaQw/juxxT7WGEW9WJ6VcODlOIRTajwUluhfi
	NpJC+NgSS58JCWVn0cNXtXqJbQmk5zmnNuUJg6A+cJ7Z8k/WoFQVKXHZdisxXlcVOUU=
X-Gm-Gg: AeBDietSy3kzF97c9TN35poXTcUFQ+pybOo71wekSx1vvoJzqAxCQXwNXZbbXpRN5wH
	7cIdIr760O2pr94pCJDnHY0aHAzIaRzMB6hl+4iLAXsZVTuU4LsKoYC5VzLB1tRLkdDqV9oY5GH
	cypQYf/PCtB4O/G/v40r0daX6tvj8g8GwkM/lZAW42c1swp39olSOwnvJccN76/q6LWxHFr2wDU
	qGCGBu7hGXaua82a2wccVHk3moprLuKrHYVGJNFFm83XozCoDN76OGciBezd7rQ/62vcHO11Dlp
	w/QxxZv+u0B+hQvEnc8wmtvABwMRJyBViKhaXBa9nAxFFU8PwgD+mx5fqgNbBG4PmhRo33PQbmx
	SL953JLlrhe2vQgJB4GIsNVM3J87m7eHf0t1uqTv03mOZonmYpLTlRdBLbPJkOcbwzGpKuBJ1hZ
	sBmtlSjkjKgtUoIeDpEt5tiseqfUcRNSYaQ/L8hmcsilJOq1BjMDkd60nLS6VMoNtos7m7wpY=
X-Received: by 2002:a05:6122:3704:b0:56f:a329:6859 with SMTP id 71dfb90a1353d-56fa58a562cmr17833293e0c.7.1777015982410;
        Fri, 24 Apr 2026 00:33:02 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa92f2207sm12925658e0c.10.2026.04.24.00.32.59
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:33:00 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso4607151241.2
        for <linux-m68k@vger.kernel.org>; Fri, 24 Apr 2026 00:32:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ex4b9frqyy9So1Ws9PZ18WSo6YTMu98ChziEEtPCyRrB25zg4ODmsAnPcSkyrM258scbpBGxZg9bk@vger.kernel.org
X-Received: by 2002:a05:6102:5801:b0:614:bef5:637c with SMTP id
 ada2fe7eead31-616f142f347mr16348590137.0.1777015979297; Fri, 24 Apr 2026
 00:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <08f8444c7237566ffb4ba8c9eb0ab4b4a5f14440.camel@kernel.org>
 <1b340c4e635dcab3bed8c52d6381b4c341c0741a.camel@physik.fu-berlin.de>
 <20260415144722.GB74178@macsyma-wired.lan> <f48c40f6-ae26-d16b-5332-554042cd85fa@kolla.no>
In-Reply-To: <f48c40f6-ae26-d16b-5332-554042cd85fa@kolla.no>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:32:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVouMXAvV-7xqSyCGYGjecoXp0dbZJc71ydTk1ZVjQFAw@mail.gmail.com>
X-Gm-Features: AQROBzCmvllIMxekOPEHB5GfKFLONKLmj3_0tjYr_UBw_DXckSWhX6-rJTkq5-Y
Message-ID: <CAMuHMdVouMXAvV-7xqSyCGYGjecoXp0dbZJc71ydTk1ZVjQFAw@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Should we make inode->i_ino a u64?
To: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Cc: Theodore Tso <tytso@mit.edu>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Jeff Layton <jlayton@kernel.org>, lsf-pc@lists.linux-foundation.org, 
	linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-m68k <linux-m68k@vger.kernel.org>, linux-sh <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kolbj=C3=B8rn,

On Fri, 24 Apr 2026 at 08:46, Kolbj=C3=B8rn Barmen <linux-m68k@kolla.no> wr=
ote:
> On Wed, 15 Apr 2026, Theodore Tso wrote:
> > Like Debian, the Linux kernel development community is very much a
> > do-ocracy --- only more so.  If the 32-bit community really cares about
> > Linux support, they need to be providing volunteer labor to kernel
> > development, instead of demanding that everyone else pay the overhead
> > tax of supporting 32-bit platforms which are rapidly disappearing.
>
> This tells me that it is time for "the 32-bit community" (wtf) to either
> look elsewhere, or start thinking of forking the Linux kernel perhaps
> sooner rather than later, so we don't bother "the 64-bit community" so
> much.
>
> > I will note that Debian itself has made the decision to stop supporting
> > the Debian Installer for i386 and the 32-bit armel platform in Debian T=
rixie.

Note "armel", not "armhf".

> Which is why (for example) Raspberry Pi is maintaining their own Raspberr=
y Pi OS,
> as they have 32-bit systems that aren't EOL for another 3-4 years.

https://lwn.net/Articles/1051010/:
"In 204x, support for the last 32-bit architectures would be removed."

However, by then they will have all run out of memory.
E.g. we recently got 64 (128 on 64-bit) KiB of "gaps", cfr.
https://lore.kernel.org/all/20260415190454.2632348-1-geert@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
