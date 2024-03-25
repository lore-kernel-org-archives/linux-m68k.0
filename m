Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471751CAA5
	for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Mar 2024 22:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711405608; cv=none; b=lkrd5tjmzqBC/hG1gdBiPLyp/IjSb7RMJspSmXtSq4PNT221OpJ/u0fzouBFASOvTg+RKZvXJmMVV/5R/QRDHGW/jZjAsav4VeyxH0bkSx0toAscAyoPTLJaQycphI9GfVZOYVCT/AJ3n6AOjpmcYoRrVjFe+GR9v/ndX9JzOgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711405608; c=relaxed/simple;
	bh=9DWbKgUB6mnK0A+oIyZx2wo110p25ZB6YYMClbVxdQM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t5FWxN7+HPTUS5DmtHnyKgaP5A2mtl/sA5NI+0yZrUth5mMo1sgHkwr41omGvhwN+aCVhhPZPkrHHX4nbkdVmb+iKsliwGwUTe3UKFTDl1CxMbPWsz+9cNoaAiqbZUGABD5llq3OUSBJSNn77gVb7vA0VDqS6gCx2AuHP/eHzEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XHpibmaQ; arc=none smtp.client-ip=66.111.4.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XHpibmaQ"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 048F65C0076;
	Mon, 25 Mar 2024 18:26:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 25 Mar 2024 18:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711405605; x=1711492005; bh=iHc8RN5oUPt/dq/jMFfdJpZLOMNv
	jfpKbYpJR9XYx6w=; b=XHpibmaQfxiqRpQXspEt5C1teTEgLlQaoPeeMft0r5/K
	rdeGypnDnaQyj472A6Efhxvd9PSkKTigeH7yraRf8QJ1mdAfrqtyiDT+q9yBwa9K
	9E2Yji2k2fG2ExdkckBnXyYqOFNNiDthJMs/It+2cj6LIflTtkyVVfSluJ3w/ucr
	oDm/yWzpU022n2aM5fcGB+Nugu3eI48Q+jTW8j/TIk4hSsaluRZTNpD2CJeSQbOW
	vsyPAtsoSISaMpkMdba5p8vmH+18ALnXerhzk8vCLd7aDNwcgH3jY8JIRInVtZy4
	jQ/lI+/wG1Sn/iZo6OMoobzs0W9Oq926H6vKAmKqNQ==
X-ME-Sender: <xms:JPoBZvXL4a7W_vYfH9HBTZD6-UgqUZmjNbL2rodvWszYtgpS1g8bnQ>
    <xme:JPoBZnkRNBeglIJjFhL2184lCH70Z1ETAfFnnt_YBCRJZV1IReGIONkzEZ6pm-CMj
    KePKlhSsBZUVI9vW2s>
X-ME-Received: <xmr:JPoBZrZ-yqmloBaW-n1UIGgWYsZiycrnvjTK6aBueoqtmuMVDW6RSIpRp4Rj-80S8cz9zYDA-fmgGNnZXii9IwmI-fs1Q-qxZDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduuddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:JPoBZqXjuiEe7WSd8ggZHa9JwhMzvaYcDikqNhwJ8EeV3hrgBj_4eQ>
    <xmx:JPoBZpnveHPgj6gGDJRb4Ukodyq95SAMzkeVjgd3U1tvsFEIFb0jNw>
    <xmx:JPoBZncWtOFjVt0T3SuKxrwqkKTcHihUGKo7PJX1UdIbhAKUcv23lg>
    <xmx:JPoBZjEMLkC3dgVOKh7wptW9aPiWTK-VtKJ6UK-o3C-oEmOOJCatSA>
    <xmx:JfoBZuz2TmTggAgsMKAnayzR8IfG5rH6srPvVI59AX46ZH0j-tdY_A>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Mar 2024 18:26:41 -0400 (EDT)
Date: Tue, 26 Mar 2024 09:28:10 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were
 disabled
In-Reply-To: <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com>
Message-ID: <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com> <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org> <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com> <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com> <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com> <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Mon, 25 Mar 2024, Michael Schmitz wrote:

> Unfortunately, when I add preempt_disable()/ 
> sched_preempt_enable_noresched() in free_pointer_table(), I don't get 
> that particular panic() anymore,

I'd like to try that patch. Would you send it please?

> but the bad kernel buserror with the warning from set_fc() that you 
> reported...

I think those set_fc() calls are confined to 68040 fault handling. Maybe 
we should try running stress tests on a 68030?
