Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D5750245
	for <linux-m68k@vger.kernel.org>; Thu,  8 Feb 2024 22:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707432701; cv=none; b=l42x8tdS9RsSQ/riOKYoXu57kR5kpwEZI3/u2Fq+jfaBYYkNzaDM707E9S/wfM9s5hFvpGEc7qeRyOt+jJ0yebd/QVSJzDTpMYSBipSSRwd2X1qNisonKJd57XLFfpWoZXqbv25d3PY5Cc0XTy+ROBWNWVSnctNWUeB0AHQ1Qs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707432701; c=relaxed/simple;
	bh=jSrA+oK5OVgRwIZ3elEBowm61Hm7vmXAfNLvhxNCo2E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oBLQ/KQ0NKVn0FPwC32CWFSDvpGKq7226FMsKU4+0ePKC75oySYxC6ZxEKxnU/FmGXN+LlKUPSY65l+q/RONN48vBU0YCEoWrD9/xAxztPicsWG9sPj0QuvqquUlEKSSJpJbyl6OILm3S1DbzkyKg3YCxifUy97uMgSsJicG2JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uVe64oLz; arc=none smtp.client-ip=66.111.4.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uVe64oLz"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 063985C00B9;
	Thu,  8 Feb 2024 17:51:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 08 Feb 2024 17:51:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707432697; x=1707519097; bh=uPAUpV5wzl3qhpBbOxbaYYD3NZes
	CzOB8/MDhmnwGnE=; b=uVe64oLzA8tNlJI60dL5DN30NxSCGAr8Pk8EFC17QPaS
	mREk6p4IV7fCcwjKLWK1pHRdEcwFL2/VSvz2PzxrwtEDW76vfKHe5E3jq/fXd2o7
	RlKw4Rttn5JuIcEeh4jk9VAL7EpO/8POjwNkk7LrBy17GyzHqYGxkwCE8wTfY29Y
	KIYKYwQC+gOoQJsEW9fnIIt0sB9FYtTJx/mjL8Gm96PH8zHBVJ1oPX1YYGI81fQN
	cY92FxcFab9zQrx8scKmIRhJ83frv1mnb+9lvahX7C7dmf1Uz4D93p31GRWctfDF
	JVAM3CMZsh5JuBlXwiIIGcRbK+8X3y/cX1hNywaQlw==
X-ME-Sender: <xms:-FrFZWyCKQmFlLddhP8cYdzuc99nun4QGp_uQhAOkmeV7XZv-KV0gQ>
    <xme:-FrFZSSsX13DJrlSlRjyiV8EzuobdzP9WT-m8iAHU92tFkpg0jwlDpBjI6fhOPGR_
    _2jnRCWHaJXoR3sw9c>
X-ME-Received: <xmr:-FrFZYX79JYUh9587OTgs7FW9QwDha41PdTcvli8JVE8Vgoqa9edZr7EmPG5cMl4iJEsKEKBvuhCnPKqaLMr-prxLAj_fA5wIyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrtdehgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepfeeiheejvdetgfeitddutefhkeeilefhveehgfdvtdekkedvkeehffdtkeev
    vdeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
    rdhorhhg
X-ME-Proxy: <xmx:-FrFZcgByNm7UfxaC0vnUrEMl7taTHnoRo4iy2NVVAgo96OmUTqz2w>
    <xmx:-FrFZYA2ZrwGJBXcNL1Pe9P4RRSRVTJueD2aXuZrGuQktkqCDT7uGQ>
    <xmx:-FrFZdLQYsu6-_TVytABUMgdW7v5cEmHNSymF6W5teQrhz7nG-N4Ww>
    <xmx:-VrFZbO-cRknYQHT7rhMTMOi_HcDJEWyplRuXExM3SbspSglhWpmZQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Feb 2024 17:51:34 -0500 (EST)
Date: Fri, 9 Feb 2024 09:51:28 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Ulrich Hecht <uli@fpond.eu>, Al Viro <viro@zeniv.linux.org.uk>
cc: Michael Schmitz <schmitzmic@gmail.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org
Subject: Re: [PATCH RFC v2 4/8] m68k: Handle arrivals of multiple signals
 correctly
In-Reply-To: <1501038841.1120470.1707393238298@webmail.strato.com>
Message-ID: <34d37f57-3146-8aa0-7828-2df2d1679ee4@linux-m68k.org>
References: <20240205023236.9325-1-schmitzmic@gmail.com> <20240205023236.9325-5-schmitzmic@gmail.com> <CAMuHMdUMwQSEwDQ3tsmChutY3P0VQUA0A8jg63NxfyrmxfKWXQ@mail.gmail.com> <401b6911-e6ed-3e9f-9dcc-d4f951c6beef@gmail.com>
 <1501038841.1120470.1707393238298@webmail.strato.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Thu, 8 Feb 2024, Ulrich Hecht wrote:

> 
> > On 02/05/2024 11:15 AM CET Michael Schmitz <schmitzmic@gmail.com> 
> > wrote: On that note - Uli: would you prefer the entire backport 
> > series, or only those you do not already have?
> 
> I'd prefer to only get what's missing.
> 

Ulrich, I imagine that you would normally receive fixes via the 
corresponding -stable trees. If Michael's series went into 
stable/linux-4.19.y you could cherry-pick from there for your v4.4.y tree 
and maybe avoid some merge conflicts that way. So perhaps we should ask 
the -stable maintainers to backport first (?)

Al, I see that the following commits are missing from stable/linux-v6.1 
and older trees, despite the word "fix" in the subject. Reading the merge 
commit 1a8d05a726dc "Merge tag 'pull-fixes' of 
git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs" suggests to me 
that these are old bugs...

bd75497a77cc m68k: fix livelock in uaccess
d835eb3a57de riscv: fix livelock in uaccess
0b92ed09cb9f hexagon: fix livelock in uaccess
15261678a8c2 parisc: fix livelock in uaccess
dce45493aff3 alpha: fix livelock in uaccess
79c54c97c773 sparc: fix livelock in uaccess
d088af1e221c ia64: fix livelock in uaccess
a1179ac743e8 microblaze: fix livelock in uaccess
e902e508c5b2 nios2: fix livelock in uaccess
caa82ae7ef52 openrisc: fix livelock in uaccess

In addition, stable/linux-v5.10 and the older trees lack the following 
commit, despite the Fixes tag.

50e43a573344 m68k: Update ->thread.esp0 before calling syscall_trace() in ret_from_signal
