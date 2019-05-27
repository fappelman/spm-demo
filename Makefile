test: build
	./.build/debug/demo testimage.png

build: update
	swift build

update:
	swift package update

xcode: update
	swift package generate-xcodeproj

clean:
	rm -rf .build demo.xcodeproj package.resolved