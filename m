Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF153D1CA2
	for <linux-m68k@vger.kernel.org>; Wed, 20 May 2026 11:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275376; cv=pass; b=umcf2CXck5N9ZQTCC0QzInsSoQVpb0iJ9dAXEab3BkBGPTxVVybbCNoHEdH+8bLHZC1cKxky8dCCI/D4byFdw9JJho6QKb7ocAdPfbcjATxQoafpl4v/uAfptOSBRTesBafwLBk/h1BRDjZA4YrjBnmNnF+0s3MWBU6WGnVv3AA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275376; c=relaxed/simple;
	bh=k3lNWwV0rao9XrwGKf/U2hovTjY91zhr4x1P5mx8Ves=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYeRZ9SMNxhMvUHYvCwyUKKcbbaD+OnLPsQRgptfYofSQ9j/2X/z6sG2IZZbe39RMxJTDBl7VLbPHLGpCYQGbcyF9vnzzq7XNTai/ddqcPXTkDeCAZhrBLzfe/7sxT+wg7fJb3ba0s9rBV4drnBkqjt1b32dI2gOiJWNivUHMik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqhzQiuc; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqhzQiuc"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so8607600e87.3
        for <linux-m68k@vger.kernel.org>; Wed, 20 May 2026 04:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779275373; cv=none;
        d=google.com; s=arc-20240605;
        b=GHXPWryabW21RL434I+2g8IF8QZxPfp2pWt1NWTVwSaoNkycGotVJiT3ihnObBS+qe
         +vrlMSk2U3f/vFwNiDqWWPeag6x+uA7BtL6Og0vrcslpH3/taZsFymyG+8J9ZqX54AxT
         jZnqLmd/6VDXYrrklL4edLkmks2NRlh0/Fleocn5HX4hXU6f+aW8Kk1tLOH80pLkqGrL
         IU9cZ7cUy0pG8cvkbi6McKGHvI91pdUU9YP0f83nf7TvfylntGVGyN7BC3agjr1v/ETj
         Mn5HRW5aietfLiM3YruaQCorF2tvIDJRH07pZCStcLC2kI65Y+kdaUo6pUb9RcxP3duw
         3DZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=bon934iBmVXAw6XfqdUyBhRxLCTbplFFvWpyhOCk/AU=;
        fh=EmZoI/uYeTw4KqBir1wbEnm9DgjuEI/p+o5DEifw8QU=;
        b=ikPvXz934ZxftmLqM2RdxFKSqUaAS/bdt976L3bj36tIhBerS2om5339OcyifyMloC
         T1mJkVXtQnNRtKhnZAWTvXvp28aWBNTehv3hOfJFGgYxnhHPVQI1DWsPKVdtx35HFsis
         2nTYOht1bNg8HqzRXjlGenGCxdAcYY3oPY+bwlj9nAYRbsgD5hj8tHcfkYpunnw8AVz/
         pOqZ7QrLWCn/qhwHadnHok928LmIjj6vseDkYkqGNA+HfMwRfi1gSqaCumYK2gjb0ho7
         jBHn+qr1i/ybyEbl7dJ2glhXi1HgObkoLxjjwCvm0Nvq0Jmgl50OBprP3LdWZRjPhOs0
         J9uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779275373; x=1779880173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bon934iBmVXAw6XfqdUyBhRxLCTbplFFvWpyhOCk/AU=;
        b=bqhzQiucEuHV2t5hOFhUgXLDK6hZDmIBaW0ZXWeh4tZ7LxiVQF9cCEp1HFdx1Elzg+
         i6mWUlZvt36qKF3SSRpgscZnG3sGZ/MdrK12UuSofg0ltiZZJq+0OJ8FDuahUTmA/5Ur
         DeDhlpNr96MarBHdChHMRl/VB/pNK629XHuZiJS+65OdL+kPnuy80FPEKmlJ+sp+2LLj
         lyqf0/oFwO+MRmRLcC/AxK53h/hJH9vxGmBCwEyRq81h1LhzbkUPfJMVky4I51+W45K/
         /yOCyU9H1kmwceQaSRFl+JkNP605i3IQTBu71whGg0JZCK5VJ+CJyGccXyx7Z03txs3P
         muHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779275373; x=1779880173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bon934iBmVXAw6XfqdUyBhRxLCTbplFFvWpyhOCk/AU=;
        b=FeTSCTsY0u0KVx38HJT2CNWlcuSbEUq6SUScfVAVJOuXlRgJuyM7vntXJXDNFn/UbX
         ZB2IJyNxdm8BsyO5LsXFEK7xqTFhMKwsFOF2aFUJUPAkPqUCFSqenwpDLMt3xEfilXt+
         m85YI1sacfMw2ETWFds0Zr8r3kmdUuhaq6pDRgv5RJCkxaY9yS7O2CPi7gMZd8vwF+q3
         H+VdqSCaCpbHAn961ubtVbWQ5tUM3cq4mOwOH+VTzKuR1lgUs2uZtzEsQH6hGstHJv8z
         Lkz1VRM1UekOPOLZpfKlZ6tLZp3gOoJuk+Sm7ebtQYsBAUVAXrnSvTS8UwUzI3oP0loA
         VD6g==
X-Forwarded-Encrypted: i=1; AFNElJ9rPc2bIG73b8mRzjBKB57GIh05C7C9cpnn72lrDTMDBu+Tp+KIWUMEwChV0xxKRp1/o88gdGyChIGN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy05OsBtyKKoFN7TPk7vlzVsE4RagDOmz3htdVDX+hGGWOmuHM9
	ROzr85VjKvRw1ftlAUQafu5W5nsg9hEcEUEfvFH5JExHm7CEuVCU87pdyO55Sbr5UgMUBRNMJsu
	fWtJEEhUtYw39vzulrIq8xZc1KtcJ0ZP6lLnI
X-Gm-Gg: Acq92OFcIKtfPQYCxwe/O6E/5gHWg26WEqSP5U7s9FF3+pQMlOnrci1df/gMcatUgtF
	8PaA1kxyfISOS+jUQ1vLH7r0qN+XEIIr5BFKkjKA8MQKS9CzMKQfxp4UYl6sJ+qXkZhzNCK93sD
	FgZcRhoxoZFJ0F45k6Q5GsvLMOwE5veJeoTsOgYRNCu4eMfz3GUpHz7Wjptzyn5gZxogBRZS63g
	ryhVBHyMcS2oCOe6vDCeaJZwTLFiC4rJFR8XW8VDdfspeEQjcGuE0aO6+t/uON48W8p4LfJTMO5
	GKLAZi0rW+IufyuvN48qoA07xMKjDah6cqRcnTdzAdOy/3nYs9vK6MIu53KpGtZRr4c=
X-Received: by 2002:a05:6512:31c3:b0:5a8:73c3:f270 with SMTP id
 2adb3069b0e04-5aa0e60cff4mr7082086e87.8.1779275372627; Wed, 20 May 2026
 04:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <29d725b5647c176b8cef0d3442d1b3440e6a1a9a.camel@physik.fu-berlin.de>
 <6efb67b12fd971c6d38a692d7b391ce4a75b0f4a.camel@physik.fu-berlin.de> <e6e99dd2a47881aaf34ea8d1dbc5ea8d6080c1c1.camel@physik.fu-berlin.de>
In-Reply-To: <e6e99dd2a47881aaf34ea8d1dbc5ea8d6080c1c1.camel@physik.fu-berlin.de>
Reply-To: noloader@gmail.com
From: Jeffrey Walton <noloader@gmail.com>
Date: Wed, 20 May 2026 07:08:54 -0400
X-Gm-Features: AVHnY4IDQKX7cV6AhquIz42ntpJ8sE8n0GLYNXPeqYOWUQZKAPTvVGE9F7oN_JI
Message-ID: <CAH8yC8kmOL39PKZBk=JK4GbjPR6WcAUnr3JGCjN3aRKOtmJ6Dg@mail.gmail.com>
Subject: Re: First successful cargo build - Re: Summary on what's blocking
 full Rust support on m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>, 
	port-m68k <port-m68k@netbsd.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 4:37=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> On Mon, 2026-05-18 at 15:03 +0200, John Paul Adrian Glaubitz wrote:
> > I have used Google Gemini Code Assist now [1] in order to create a patc=
h to add support for 32-bit
> > relocations to the LLVM M68k backend. This time, the code makes use of =
the full capabilities of
> > 68020+ CPUs and does not the inefficient four-instruction method to imp=
lement 32-bit accesses.
> >
> > I'm hesitant to send this in for review as this was basically written b=
y Gemini under my supervision
> > with a lot of testing of build tests.
>
> I was eventually able to build cargo for m68k-unknown-linux-gnu:
>
> (unstable-amd64-sbuild)glaubitz@esk:~/rust/build$ file ./x86_64-unknown-l=
inux-gnu/stage2-tools/m68k-unknown-linux-gnu/release/cargo
> ./x86_64-unknown-linux-gnu/stage2-tools/m68k-unknown-linux-gnu/release/ca=
rgo: ELF 32-bit MSB pie executable, Motorola m68k, 68020, version 1 (SYSV),=
 dynamically linked, interpreter /lib/ld.so.1,
> BuildID[sha1]=3D7e5bf08930f87b9eaee173cf163b067f620cb841, for GNU/Linux 3=
.2.0, not stripped
> (unstable-amd64-sbuild)glaubitz@esk:~/rust/build$
>
> The binary runs on m68k but there is no output, unfortunately. Needs more=
 debugging.

Congratulations!

I'm still not convinced Rust can take over the world.  It has too many
poorly supported architectures and platforms, including m68k.  Confer,
<https://doc.rust-lang.org/nightly/rustc/platform-support.html>.

Jeff
