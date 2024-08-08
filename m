Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969E4BA2E
	for <linux-m68k@vger.kernel.org>; Thu,  8 Aug 2024 01:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723082236; cv=none; b=EJ5WeI6vzuryIYyYVL/SqBexwyvozaepXA+wyQApU0O6Hw20WbiKbqwj4wtJ05YmKUL25QIGMM5DrsnaP/kHykosALIerPC01RxuuewX3STlPCQA0b8byRjHbhdRXkxEyI4c252Q72JjeEBAMjW2YVzWtuh1PUK6GX+GAMzn7mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723082236; c=relaxed/simple;
	bh=ju1Xf8LOlEK0dWRe+HLsM7svBBlvR6jb+EDebtdKN9U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kG/DoppP3VOqVJ5Ydhzv7LYOr/yzKgiUrFKm4MuZBeXz7zSFNjCIWwKkqWObmwSFxwG2Eo2vGt0+7gMOojG6QoeV+cBJyMYMN+RyC+TnUIBQ44LpIrPtpx6qUz6/3ysx7Wn7wberuSasiP2Y1O6F9Z9FtieIUX/Z9H9CvzQE6Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MvMZNVEg; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MvMZNVEg"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 963071151C22;
	Wed,  7 Aug 2024 21:57:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 07 Aug 2024 21:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723082233; x=1723168633; bh=Z3+8UnqIGIrIw2Be4TsIAcEwYC0S
	KuJfabqWNoHmQMc=; b=MvMZNVEgoaFH1hx7zwGjqOJbCV7GNgVtRQ4Stj5sDT19
	fWVspighV3iGKOKCCMwEaAjYS+Jx582UPh4gX2TijPkNj2Z5tePwAkIERfRCdJmY
	bd027JQe6wjjvJ8nUrtTf3TWONNMMum1844UNY+RiRMUIetgIsmYiB/2HTRYj9MX
	CnB7GBj98OOloeKxFy16JFCc7xd9iRHDyXSDU/bQJARfTztGt6WZ6crARocFHPBB
	RFDoJhnSeQ98tFFn2y4GXvCMg8nksMANthV2AKECoWhrzKcVqV6F9OgB/BPpbCZZ
	ou+DDWGOxkRpRLZ92zP5FDVo6qVPEj8YJw9J8/g1lA==
X-ME-Sender: <xms:-SW0ZmCwwvHt3P57wjh-OAsdQaAr_fpXjsg4D-RilrQTcGkNr7_oJg>
    <xme:-SW0Zgh10fpHO56jfYuF2woBWdC73WmErmoG5XKPdzrWInwCQbf1qYCBaDQP8Zcy6
    wiXQJWFkx4qQ9k5o20>
X-ME-Received: <xmr:-SW0ZplcFMWOjc5f2ajoIRbT-6ZNlQg8ER7WiO1MqCtUyil8azpFmmqTV8aE9m2LLQqApH2xQj_cVYzkEIAxTtkD5Zn1zZ0I4AA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrledugdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:-SW0ZkxPzIT3Wy8YLZZbFqnREXBfJQHp8R1PolboSt2cdqTQQxB4xg>
    <xmx:-SW0ZrTPj1iU3OXPJdkXlAyeHIqAVYyM7feye4TTUIdmasyt3oExhg>
    <xmx:-SW0ZvbDrfwVKfaDXhNl_orxgOzw6hb1IYzX58PFAxSmhw_y3S67HQ>
    <xmx:-SW0ZkQFcSH8xHcQKwD7SR-Dlo8Q7Oa-oq3iTtHK1So91AAMdEiiHw>
    <xmx:-SW0ZpN4nNUUC5_04QY0icAkqO-p7hVGlj9dpMyn7bjqWmbnIwYMKgke>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Aug 2024 21:57:10 -0400 (EDT)
Date: Thu, 8 Aug 2024 11:57:14 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, gerg@linux-m68k.org, 
    linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
In-Reply-To: <42dfdef0-88d1-4c15-b04b-174f12bd8f3f@gmail.com>
Message-ID: <de7c9ac4-cb6f-e2a4-59e4-26fd7e260d4e@linux-m68k.org>
References: <20240429030945.22451-1-schmitzmic@gmail.com> <20240429030945.22451-2-schmitzmic@gmail.com> <e0d53477-1646-9504-2382-f8793d078704@linux-m68k.org> <42dfdef0-88d1-4c15-b04b-174f12bd8f3f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


Hello Michael

On Thu, 8 Aug 2024, Michael Schmitz wrote:

> > Well, that __clear_user() bug is no longer theoretical. I accidentally 
> > bumped into it when I sent a ^C to a shell script I wrote to test some 
> > mac_scsi driver patches...

...

> 
> I'm afraid I've lost track of where we're at with this patch series. 
> Does it need more work, or more bug reports such as the one below?

Apparently the series is waiting for some testing on a Coldfire system 
with MMU.

> The previous bug reports might be considered somewhat contrived but this 
> one's from 'real' user space code, and none too complex at that?
> 

Right. That code was as follows. There's nothing here aimed at 
arch/m68k/lib/uaccess.c in particular, just IO to a block device and a 
tmpfs filesystem.


#!/bin/bash

set -e -u

filename=$1

rand=/tmp/rand_test_data
zero=/tmp/zero_test_data
len=512K

dd if=/dev/urandom of=$rand bs=$len count=1 2>/dev/null
dd if=/dev/zero of=$zero bs=$len count=1 2>/dev/null

write() {
        dd $args if=$orig of=$filename # oflag=direct
}

compare() {
        echo 3 > /proc/sys/vm/drop_caches
        if ! cmp -n $len $orig $filename ; then
                diff -u <(hexdump -C < $orig) <(hexdump -C < $filename)
        fi
}

while true; do
        for args in "bs=512k count=1" "bs=64k count=8" "bs=4k count=128" "bs=512 count=1k" ; do
                echo $args
                orig=$rand ; write ; compare
                orig=$zero ; write ; compare
                sync
                echo
        done
done
